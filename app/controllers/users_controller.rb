class UsersController < ApplicationController
  before_action :authorize_user!, only: [:new, :index]
  before_action :set_user, only: [:destroy]

  def new
    @user = User.new
  end

  def index
    @users = User.all.page(params[:page])
  end

  def profile
    if user_signed_in?
      @user = User.find(params[:user_id])
    else
      respond_to do |format|
        format.html { redirect_to root_path, alert: 'You need to Sign in before continuing.' }
        format.json { head :no_content }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_path, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def user_params
    params.require(:user).permit(:avatar)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def authorize_user!
    authorize! :manage, User
  end
end
