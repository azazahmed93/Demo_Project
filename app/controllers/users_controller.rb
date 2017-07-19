class UsersController < ApplicationController

  def new
    @user= User.new
  end

  def show
    @user= current_user
  end
  def profile
    
  end
  def user_params
    params.require(:user).permit(:avatar)
  end

end
