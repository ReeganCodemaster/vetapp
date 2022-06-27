class Appointment < ApplicationRecord
  belongs_to :registration

  validates_presence_of :date
end