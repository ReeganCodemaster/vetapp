require 'rails_helper'

RSpec.describe AuthenticateUser do 
  let(:user) { create(:user) }
  subject(:valid_auth_obj) {described_class.new(user.email, user.password)}
  subject(:invalid_auth_obj) {described_class.new('foo','bar')}
end