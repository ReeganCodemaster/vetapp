class RegistrationSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :pet_id, :registration_date, :accepted

  has_many :appointments
end
