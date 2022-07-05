class RegistrationsController < ApplicationController
  def update
    registration = Registration.find(params[:id])
    registration.update(accepted: true)

    user = registration.pet.users.where(role: 'owner').last

    json_response(registration.user)
  end

  def create
    # binding.pry
    pet = Pet.find(params[:pet_id])
    vet = User.find_by(email: params[:vet_email])
    if vet.present?
      user = pet.users.find_by(role: 'owner')

      pet.registrations.create!(user_id:vet.id, registration_date: DateTime.now, vet_registration: true)
      json_response(current_user, status = :created)
    else
      json_response({message: "Vet does't exist"}, staus = :unprocessable_entity)
    end
  end
end
