class UsersController < ApplicationController
	def index
		@users = User.all
		if params[:search]
    		@users = User.search(params[:search]).order("created_at DESC")
  		else
    		@users = User.all.order('created_at DESC')
  		end
	end

	def show
		@user = User.find(params[:id])
	end

	def update 
		current_user.update(params[:user].permit(:avatar)) 
	end 

	def destroy
		current_user.destroy
		redirect_to(posts_url)
		set_flash('Your account was successfully deleted')
	end
end
