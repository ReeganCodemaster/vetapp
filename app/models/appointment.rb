class PetsUsers < ApplicationRecord
  belongs_to :vets
  belongs_to :animal
end