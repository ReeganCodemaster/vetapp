class AppointmentsController < ApplicationController
  def create
    appointment = Appointment.create!(appointment_pararms)
    json_response(message:Message.apointment_succesfull, user:appointment.user)
  end

  private
  def appointment_pararms
    params.permit(:pet_id, :id, :appointment_date)
  end
end
