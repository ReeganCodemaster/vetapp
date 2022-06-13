class UsersController < ApplicationController
  skip_before_action :authorize_request, only: :create
  def create
    user = User.create!(user_params)
    auth_token = AuthenticateUser.new(user.email, user.password, user.role).call('signup')[:auth_token]
    response = { message:  Message.account_created, auth_token: auth_token, user: user }
    json_response(response, :created)
  end

  def registrations 
    registrations = Registration.where(user_id: params[:id]).where(accepted: false)
    json_response(registrations)
  end
  
  private
  def user_params 
    params.permit(:name,:email,:password,:password_confirmation, :role)
  end
end
