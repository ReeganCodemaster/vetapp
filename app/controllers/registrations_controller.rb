class RegistrationsController < ApplicationController
  def registrations
    registrations = Registration.where(user_id: params[:id]).where(accepted: false)
    json_response(registrations)
  end
end
