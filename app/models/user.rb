class User < ActiveRecord::Base
  acts_as_voter

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

    has_many(:posts, dependent: :destroy)

    has_many(:follows, foreign_key: :following_user_id)
	has_many(:followed_users, through: :follows, class_name: 'User')

      has_many(:followings, foreign_key: :followed_user_id, class_name: "Follow")
  has_many(:following_users, through: :followings, class_name: 'User')

	has_many(:followed_posts, through: :followed_users, source: :posts)

  has_attached_file(:avatar, 
        styles: {medium: '300x300>', thumb: '100x100>'}, 
        default_url: ':style/missing.png', 
        storage: :s3,   
        s3_credentials: Proc.new { |a| a.instance.s3_credentials })

  def s3_credentials     
    {bucket: 'wordoutbucket',     
    access_key_id: 'AKIAJRN4NDNRXO4JX54Q',     
    secret_access_key: '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'}   
  end

  validates_attachment_content_type(:avatar, content_type: /\Aimage\/.*\Z/)

	def follows?(user)
		followed_users.include?(user)
	end

    def self.search(search)
      where("email ILIKE ?", "%#{search}%") 
  end

end