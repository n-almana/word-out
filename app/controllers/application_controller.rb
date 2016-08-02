class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:displayname])
  end

  private

	def redirect_to_and_set_flash(url, message)
		redirect_to(url)
		set_flash(message)
	end

	def set_flash(message)
		flash[:info] = message
	end
	
end
