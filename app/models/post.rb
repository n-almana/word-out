class Post < ActiveRecord::Base
	belongs_to(:user)

	validates_presence_of(:text, :title) 

	def title_and_author
		"#{title} by #{user.displayname}"
	end

	def self.search(search)
		search = "%#{search}%"

  		includes(:user).
  		references(:user).
  		where("posts.title LIKE ? OR posts.text LIKE ? OR users.displayname LIKE ?", search, search, search) 
	end

end
