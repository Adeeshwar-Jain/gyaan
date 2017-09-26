class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
def configure_permitted_parameters
	devise_parameter_sanitizer.permit(:sign_up) do |user_params|
	   user_params.permit(:username,:email,:password, :password_confirmation,:first_name,:last_name)
	end

	devise_parameter_sanitizer.permit(:sign_in) do |user_params|
	   user_params.permit(:username,:email,:password,:remember_me)
	end

	devise_parameter_sanitizer.permit(:edit) do |user_params|
	   user_params.permit(:username,:email,:password,:password_confirmation,:first_name,:last_name,:current_password)
	end

end
end
