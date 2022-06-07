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

    context 'when request is invalid' do
      context 'when missing token' do
        it 'raises MissingToken error' do
          expect {invalid_request.call}.to raise_error(ExceptionHandler::MissingToken, 'Missing token') 
        end
      end
    end
  end
end
