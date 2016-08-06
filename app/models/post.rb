class Post < ActiveRecord::Base
	acts_as_votable

	belongs_to(:user)

	validates_presence_of(:text, :title) 

	def title_and_author
		"#{title} by #{user.displayname}"
	end

	def self.search(search)
		search = "%#{search}%"

  		includes(:user).
  		references(:user).
  		where("posts.title ILIKE ? OR posts.text LIKE ? OR users.displayname ILIKE ?", search, search, search) 
	end

	def score 
		self.get_upvotes.size - self.get_downvotes.size
	end 

end
