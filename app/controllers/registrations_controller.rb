class RegistrationsController < ApplicationController
  def accept_registration
    registration = Registration.find(registration_params[:id])
    registration.update(accepted: true)

    json_response(message: Message.registration_updated, user: registration.user)
  end

  private
  def registration_params
    params.permit(:id)
  end
end
