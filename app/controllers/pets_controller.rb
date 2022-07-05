class PetsController < ApplicationController
  def create
    pet = current_user.pets.create!(name: pet_params[:name], animal: pet_params[:animal])
    json_response(current_user, status = :created)
  end

  private
  def pet_params
    params.permit(:id, :name, :animal, :vet_email)
  end
end
