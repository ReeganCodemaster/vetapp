require 'rails_helper'

RSpec.describe 'Users API' do
  let(:user) {build(:user)}
  let(:headers) { valid_headers.except('Authorization') }
  let(:valid_attributes) { attributes_for(:user, password_confirmation: user.password)}

  
end