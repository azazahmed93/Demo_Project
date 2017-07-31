class UsersController < ApplicationController
  before_action :verify_user!, only: [:new, :index]

  def new
    @user = User.new
  end

  def index
    @users = User.all.page(params[:page])
  end

  private

  def user_params
    params.require(:user).permit(:avatar)
  end

  def verify_user!
    authorize! :manage, User
  end
end
