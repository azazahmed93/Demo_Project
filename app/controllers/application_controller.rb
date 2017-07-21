class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_filter :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:avatar, :admin, :email, :password, :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:avatar, :password, :password_confirmation, :current_password) }
    devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:avatar, :email, :password, :remember_me) }
  end
  rescue_from CanCan::AccessDenied do |exception|
  redirect_to main_app.root_url, :notice => exception.message
  end
end
