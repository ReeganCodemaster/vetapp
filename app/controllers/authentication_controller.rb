class AuthenticationController < ApplicationController
  skip_before_action :authorize_request, only: :authenticate
  def authenticate
    user = User.find_by(email: params[:email])
    if user
      user.password = params[:password]
      auth_response(user) 
    else
      render json: {message: 'Invalid credentials'}, status: :unprocessable_entity
    end
  end

  private
  def auth_params
    params.permit(:email, :password)
  end
end
