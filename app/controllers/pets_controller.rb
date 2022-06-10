class PetsController < ApplicationController
  def create
    pet = current_user.pets.create!(pet_params)
    json_response(message:Message.pet_created)
  end

  def register
    pet = Pet.find(pet_params[:id])
    vet = User.find_by(email: pet_params[:vet_email])
    pet.PetsUsers.user_id = vet.id
  end

  private
  def pet_params
    params.permit(:id, :name, :animal, :vet_email)
  end
end
