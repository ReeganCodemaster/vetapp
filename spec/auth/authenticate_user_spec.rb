require 'rails_helper'

RSpec.describe AuthenticateUser do 
  let(:user) { create(:user) }
  subject(:valid_auth) {described_class.new(user.email, user.password)}
  subject(:invalid_auth) {described_class.new('foo','bar')}

  describe '#call' do
    context 'when credentials are valid' do
      it 'returns a valid auth token' do
        token = valid_auth.call
        expect(token).not_to be_nil
      end
    end
  end
end