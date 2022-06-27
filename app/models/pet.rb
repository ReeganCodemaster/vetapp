class Pet < ApplicationRecord
  has_many :registrations, dependent: :destroy
  has_many :users, through: :registrations, dependent: :destroy
  # has_many :appointments, through: :registrations

  def owner
    self.users.where(role: 'owner').last
  end

  validates_presence_of :name, :animal
end
