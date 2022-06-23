class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :name, :role

  has_many :pets, through: :registrations
end
