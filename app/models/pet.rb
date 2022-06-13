class Pet < ApplicationRecord
  has_many :registrations
  has_many :users, through: :registrations
  has_many :appointments, through: :registrations
end
