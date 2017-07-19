class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_filter :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:avatar, :admin, :username, :email, :password, :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:avatar, :admin, :username, :email, :password, :remember_me) }
  end
  
  def after_sign_in_path_for(resource)
  	if current_user.admin==true
  		new_movie_path
  	else
  		movies_path
  	end
  end
end
