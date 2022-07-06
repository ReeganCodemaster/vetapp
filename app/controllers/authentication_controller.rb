class AuthenticationController < ApplicationController
  skip_before_action :authorize_request, only: :authenticate
  def authenticate
    begin
      user = User.find_by(email: params[:email])
      user.password = params[:password]
      auth_response(user) 
    rescue
      raise(ExceptionHandler::AuthenticationError, Message.invalid_credentials)
    end
  end

  private
  def auth_params
    params.permit(:email, :password)
  end
end
