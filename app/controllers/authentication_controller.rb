class AuthenticationController < ApplicationController
  skip_before_action :authorize_request, only: :authenticate
  def authenticate
    auth_response = AuthenticateUser.new(auth_params[:email], auth_params[:password]).call('signin')
    json_response(auth_token: auth_response[:auth_token], user: auth_response[:user])
  end

  private
  def auth_params
    params.permit(:email, :password)
  end
end
