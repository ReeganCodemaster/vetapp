class RegistrationSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :pet_id, :registration_date, :accepted, :user, :vet_registration

   def user 
    object.user.name
   end
   
  has_many :appointments
end
