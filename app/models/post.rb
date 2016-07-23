class Post < ActiveRecord::Base
	belongs_to(:user)

	def title_and_author
		"#{title} by #{user.email}"
	end
end
