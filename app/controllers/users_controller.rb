class UsersController < ApplicationController

  def new
    @user= User.new
  end

  def all
    @users= User.all
  end

  def profile
    
  end
  def update

    @user = User.find(params[:id])
    @user.update_attribute(:avatar, params[:user][:avatar])
    
  end
  def user_params
    params.require(:user).permit(:avatar)
  end

end
