class RegistrationsController < ApplicationController
  def update
    registration = Registration.find(params[:id])
    registration.update(accepted: true)

    user = registration.pet.users.where(role: 'owner').last

    json_response(registration.user)
  end

  private
  def registration_params
    params.permit(:id)
  end
end
