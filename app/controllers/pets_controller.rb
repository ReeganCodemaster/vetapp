class PetsController < ApplicationController
  def create
    pet = current_user.pets.create!(pet_params)
    json_response(current_user, status = :created)
  end

  private
  def pet_params
    params.permit(:name, :animal)
  end
end
