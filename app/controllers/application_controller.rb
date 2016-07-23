class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  	private

	def redirect_to_and_set_flash(url, message)
		redirect_to(url)
		set_flash(message)
	end

	def set_flash(message)
		flash[:info] = message
	end
	
end
