class PetsController < ApplicationController
  def create
    pet = current_user.pets.create!(pet_params)
    json_response(current_user)
  end

  def register
    pet = Pet.find(pet_params[:id])
    vet = User.find_by(email: pet_params[:vet_email])
    pet.registrations.create!(user_id:vet.id, registration_date: Time.new)
    json_response(current_user)
  end

  private
  def pet_params
    params.permit(:id, :name, :animal, :vet_email)
  end
end
