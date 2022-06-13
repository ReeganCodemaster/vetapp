class Registration < ApplicationRecord
  belongs_to :user
  belongs_to :pet

  has_many :appointments
end
