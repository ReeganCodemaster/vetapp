class PetsController < ApplicationController
  def create
    pet = current_user.pets.create!(pet_params)
    json_response(current_user)
  end

  def register
    pet = Pet.find(pet_params[:id])
    vet = User.find_by(email: pet_params[:vet_email])
    user = pet.users.where(role: 'owner').last
    Rails.cache.write("user/#{user.id}",user, expires_in: 12.hours) 

    pet.registrations.create!(user_id:vet.id, registration_date: DateTime.now, vet_registration: true)
    json_response(current_user)
  end

  private
  def pet_params
    params.permit(:id, :name, :animal, :vet_email)
  end
end
