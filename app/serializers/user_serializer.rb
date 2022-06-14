class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :name

  has_many :appointments
  has_many :registrations

end
