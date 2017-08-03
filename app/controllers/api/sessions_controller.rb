class API::SessionsController < API::BaseController
  def create
    user = User.where(email: params[:email]).first
    if user&.valid_password?(params[:password])
      user.generate_token
      render json: user.as_json(only: [:id, :email, :auth_token]), status: :created
    else
      head(:unauthorized)
    end
  end

  def destroy

  end
end
