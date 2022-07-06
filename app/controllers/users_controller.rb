class UsersController < ApplicationController
  skip_before_action :authorize_request, only: [:create, :authenticate]

  def create
    user = User.create!(user_params)
    auth_response(user, status = :created)
  end

  def authenticate
    begin
      user = User.find_by(email: params[:email])
      user.password = params[:password]
      auth_response(user) 
    rescue
      raise(ExceptionHandler::AuthenticationError, Message.invalid_credentials)
    end
  end

  def show
    json_response(current_user)
  end

  def vets
    json_response(User.where(role: 'vet'))
  end
  
  private
  def user_params 
    params.permit(:name,:email,:password,:password_confirmation, :role)
  end
end
