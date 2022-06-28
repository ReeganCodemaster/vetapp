require 'rails_helper'

RSpec.describe Appointment, type: :model do
  it { should validate_presence_of(:date)}
end