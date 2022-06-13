class AppointmentsController < ApplicationController
  def create
    pet = Pet.find(appointment_params[:id])
    vet = User.find_by(email: appointment_params[:vet_email])
    registration = pet.registrations.find_by(user_id: vet.id)
    appointment = registration.appointments.create!(user_id: vet.id, date: appointment_params[:date].to_datetime)
    json_response(message: Message.appointment_succesfull, user:appointment.user)
  end

  private
  def appointment_params
    params.permit(:id, :vet_email, :date)
  end
end
