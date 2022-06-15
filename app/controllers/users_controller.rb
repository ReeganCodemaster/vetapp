class UsersController < ApplicationController
  skip_before_action :authorize_request, only: :create
  def create
    user = User.create!(user_params)
    auth_response(user)
  end

  def registrations 
    user = User.find(params[:id])
    json_response(user)
  end

  def show
    user = User.find(params[:id])
    json_response(user)
  end

  private
  def user_params 
    params.permit(:name,:email,:password,:password_confirmation, :role)
  end
end
