module PostsHelper
	def edit_post_link(post)
		link_to('Edit This Post', edit_post_url(post), :class => "btn btn-default")
	end 
end