class UsersController < ApplicationController
  before_filter :if_admin, only: [:new , :edit ,:create ,:destroy, :update]
  def new
    @user= User.new
  end

  def all
    @users= User.all
  end

  def profile
    
  end
  def update
    
  end
  def user_params
    params.require(:user).permit(:avatar)
  end
  private
  def if_admin
    authorize! :manage, User
  end
end
