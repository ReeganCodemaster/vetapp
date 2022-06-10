class User < ApplicationRecord
  has_and_belongs_to_many :pets

  has_secure_password

  validates_presence_of :name, :email, :password_digest, :role
end
