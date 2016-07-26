class Post < ActiveRecord::Base
	belongs_to(:user)

	validates_presence_of(:text, :title) 

	def title_and_author
		"#{title} by #{user.email}"
	end

	def self.search(search)
  		where("title LIKE ?", "%#{search}%") 
  		where("text LIKE ?", "%#{search}%")
	end

end
