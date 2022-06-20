class PetSerializer < ActiveModel::Serializer
  attributes :id, :name, :animal

  has_many :registrations
end
