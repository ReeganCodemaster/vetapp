class UsersController < ApplicationController
  skip_before_action :authorize_request, only: :create
  def create
    user = User.create!(user_params)
    auth_response(user, status = :created)
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
