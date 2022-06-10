class AuthenticationController < ApplicationController
  def authenticate
    auth_response = AuthenticateUser.new(auth_params[:email], auth_params[:password]).call('signin')
    json_response(auth_token: auth_response[:auth_token], role: auth_response[:user].role)
  end

  private
  def auth_params
    params.permit(:email, :password)
  end
end
