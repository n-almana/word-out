class PostsController < ApplicationController
	before_action :authenticate_user!

	def index
		@posts = Post.all
		if params[:search]
    		@posts = Post.search(params[:search]).order("posts.created_at DESC")
  		else
    		@posts = Post.all.order('posts.created_at DESC')
  		end
	end

	def show
		find_post
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.create(post_params.merge(user: current_user))
		redirect_to_post_and_set_flash('Created your new post')
	end

	def edit
		find_post_by_current_user
	end

	def update
		find_post_by_current_user
		@post.update(post_params)
		redirect_to_post_and_set_flash("Successfully updated #{@post.title}")
	end

	def destroy
		find_post_by_current_user
		@post.destroy
		redirect_to(posts_url)
		set_flash('The post was deleted')
	end

	def following
		@posts = current_user.followed_posts
	end

	private

	def find_post
		@post = Post.find(params[:id])
	end

	def find_post_by_current_user
		@post = current_user.posts.find(params[:id])
	end

	def redirect_to_post_and_set_flash(message)
		redirect_to_and_set_flash(@post, message)
	end

	def post_params
		params[:post].permit(:text, :title)
	end

end
