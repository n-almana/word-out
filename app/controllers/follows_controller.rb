class FollowsController < ApplicationController
	def create
		current_user.followed_users.push(followed_user)

		redirect_to_and_set_flash(:followed)
	end

	def destroy
		current_user.followed_users.destroy(followed_user)
		redirect_to_and_set_flash(:unfollowed)
	end

	private

	def followed_user
		User.find(params[:id])
	end

	def redirect_to_and_set_flash(action)
		super(users_url, "You #{action} #{followed_user.email}")
	end

end
