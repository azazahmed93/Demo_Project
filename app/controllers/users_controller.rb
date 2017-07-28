class UsersController < ApplicationController
  before_filter :is_admin, only: [:new , :edit ,:create ,:destroy, :update]
  def new
    @user = User.new
  end

  def index
    @users = User.all.page params[:page]
  end

  private

  def user_params
    params.require(:user).permit(:avatar)
  end

  def is_admin
    authorize! :manage, User
  end
end
