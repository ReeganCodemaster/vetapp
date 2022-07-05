class PetsController < ApplicationController
  def create
      pet = current_user.pets.create!(name: pet_params[:name], animal: pet_params[:animal])
      json_response(current_user, status = :created)
  end

  def register
    pet = Pet.find(pet_params[:id])
    vet = User.find_by(email: pet_params[:vet_email])
    if vet
      user = pet.users.where(role: 'owner').last

      pet.registrations.create!(user_id:vet.id, registration_date: DateTime.now, vet_registration: true)
      json_response(current_user, status = :created)
    else
      json_response({message: "Vet does't exist"}, staus = :unprocessable_entity)
    end
  end

  private
  def pet_params
    params.permit(:id, :name, :animal, :vet_email)
  end
end
