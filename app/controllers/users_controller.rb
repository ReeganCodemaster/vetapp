class UsersController < ApplicationController
  skip_before_action :authorize_request, only: :create
  def create
    user = User.create!(user_params)
    auth_response(user)
  end

  def registrations 
    registrations = Registration.where(user_id: params[:id]).where(accepted: false)
    json_response(message: Message.registration_succesfull , registration: registrations)
  end

  private
  def user_params 
    params.permit(:name,:email,:password,:password_confirmation, :role)
  end
end
