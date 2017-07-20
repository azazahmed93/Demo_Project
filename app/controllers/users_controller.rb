class UsersController < ApplicationController

  def new
    @user= User.new
  end

  def all
    @users= User.all
  end

  def show
    
  end
  def profile
    
  end
  def user_params
    params.require(:user).permit(:avatar)
  end

end
