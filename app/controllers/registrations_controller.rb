class RegistrationsController < ApplicationController
  def accept_registration
    registration = Registration.find(registration_params[:id])
    registration.update(accepted: true)

    user = registration.pet.users.where(role: 'owner').last
    Rails.cache.write("user/#{user.id}", user, expires_in: 12.hours) 

    json_response(registration.user)
  end

  private
  def registration_params
    params.permit(:id)
  end
end
