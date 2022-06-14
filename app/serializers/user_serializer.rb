class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :name

  has_many :registrations
  has_many :pets , though: :registrations
end
