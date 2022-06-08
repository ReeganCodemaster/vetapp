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
        it 'raises a MissingToken error' do
          expect {invalid_request.call}.to raise_error(ExceptionHandler::MissingToken, 'Missing token') 
        end
      end

      context 'when token is invalid' do
        subject(:invalid_request) do
          described_class.new('Authorization' => token_generator(5))
        end

        it 'raises an InvalidToken error' do
          expect {invalid_request.call}.to raise_error(ExceptionHandler::InvalidToken, /Invalid token/)
        end
      end

      context 'when token is expired' do
        let(:header) { {'Authorization' => expired_token_generator(user.id)} }
        subject(:invalid_request) {described_class.new(header)}

        it 'raises ExceptionHandler::ExpiredSignature error' do
          expect {invalid_request.call}.to raise_error(ExceptionHandler::InvalidToken, /Signature has expired/)
        end
      end

      context 'when token is fake' do
        let(:header) { {'Authorization' => 'foobar'} }
        subject(:invalid_request) {described_class.new(header)}

        it 'handles JWT::DecodeError' do
          expect {invalid_request.call}.to raise_error(ExceptionHandler::InvalidToken, /Not enough or too many segments/)
        end
      end
    end
  end
end
