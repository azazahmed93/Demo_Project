class ApplicationController < ActionController::Base
  before_filter :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user| user.permit(:avatar, :admin, :email, :password, :password_confirmation, :remember_me)
    end

    devise_parameter_sanitizer.permit(:account_update) do |user| user.permit(:avatar, :password, :password_confirmation, :current_password)
    end

    devise_parameter_sanitizer.permit(:sign_in) do |user| user.permit(:avatar, :email, :password, :remember_me)
    end
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_url, :notice => exception.message
  end
end
