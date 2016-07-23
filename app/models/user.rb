class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

    has_many(:posts)

    has_many(:follows, foreign_key: :following_user_id)
	has_many(:followed_users, through: :follows, class_name: 'User')

	has_many(:followed_posts, through: :followed_users, source: :posts)

	def follows?(user)
		followed_users.include?(user)
	end

end
