require 'rails_helper'

RSpec.describe AuthorizeApiRequest do
  let(:user) { create(:user)}
  let(:header) {{'Authorization' => token_generator(user.id)}}
  subject(:invalid_request) {described_class.new({})}
  subject(:valid_request) {described_class.new(header)}

  describe '#call' do
    context 'when request is valid' do
      it 'returns user object' do
        result = valid_request.call
        expect(result[:user]).to eq(user)
      end
    end
  end
end
