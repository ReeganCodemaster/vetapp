class User < ApplicationRecord
  has_many :appointments
  has_many :registrations
  has_many :pets, through: :registrations

  has_secure_password

  validates_presence_of :name, :email, :password_digest, :role

  validates :email, uniqueness: true
end
