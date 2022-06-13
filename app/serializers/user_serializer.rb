class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :name, :role

  has_many :registrations
end
