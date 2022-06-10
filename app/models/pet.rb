class Pet < ApplicationRecord
  has_many :appointments
  has_many :registrations
  has_many :users, through: :registrations
end
