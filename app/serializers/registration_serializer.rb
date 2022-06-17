class RegistrationSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :pet_id, :registration_date, :accepted, :pet

  def pet
    object.pet
  end

  has_many :appointments
end
