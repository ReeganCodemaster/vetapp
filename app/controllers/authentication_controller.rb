class AuthenticationController < ApplicationController
  skip_before_action :authorize_request, only: :authenticate
  def authenticate
    user = User.find_by(email: auth_params[:email])
    auth_response(user)
  end

  private
  def auth_params
    params.permit(:email, :password)
  end
end
