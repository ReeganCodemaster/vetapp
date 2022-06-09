require 'rails_helper'

RSpec.describe AuthenticateUser do 
  describe '#call' do
    context 'when role is owner' do
      let(:user) { create(:user, role: 'owner') }
      subject(:valid_auth) {described_class.new(user.email, user.password, user.role)}

      context 'when credentials are valid' do
        it 'returns a valid auth token' do
          token = valid_auth.call
          expect(token).not_to be_nil
        end
      end

      context 'when credentials are invalid' do
        context 'when user does not exist' do
          subject(:invalid_auth) {described_class.new('foo', user.password, user.role)}
          it 'raises an authentication error' do
            expect {invalid_auth.call}.to raise_error(ExceptionHandler::AuthenticationError, /Invalid credentials/)
          end
        end
        context 'when the passsword is incorrect' do
          subject(:invalid_auth) {described_class.new(user.email, ' ', user.role)}
          it 'raises an authentication error' do
            expect {invalid_auth.call}.to raise_error(ExceptionHandler::AuthenticationError, /Invalid credentials/)
          end
        end
        
        context 'when wrong role is submitted' do
          let(:user) { create(:user, role: 'vet') }
          subject(:invalid_auth) {described_class.new(user.email, user.password, user.role)}

          it 'raises an authentication error' do
            expect {invalid_auth.call}.to raise_error(ExceptionHandler::AuthenticationError, /Invalid credentials/)
          end
        end
      end
    end

    context 'when role is vet' do
      let(:user) { create(:user, role: 'vet') }
      subject(:valid_auth) {described_class.new(user.email, user.password, user.role)}

      context 'when credentials are valid' do
        it 'returns a valid auth token' do
          token = valid_auth.call
          expect(token).not_to be_nil
        end
      end

      context 'when credentials are invalid' do
        context 'when user does not exist' do
          subject(:invalid_auth) {described_class.new('foo', user.password, user.role)}
          it 'raises an authentication error' do
            expect {invalid_auth.call}.to raise_error(ExceptionHandler::AuthenticationError, /Invalid credentials/)
          end
        end
        context 'when the passsword is incorrect' do
          subject(:invalid_auth) {described_class.new(user.email, ' ', user.role)}
          it 'raises an authentication error' do
            expect {invalid_auth.call}.to raise_error(ExceptionHandler::AuthenticationError, /Invalid credentials/)
          end
        end
        
        context 'when wrong role is submitted' do
          let(:user) { create(:user, role: 'owner') }
          subject(:invalid_auth) {described_class.new(user.email, user.password, user.role)}

          it 'raises an authentication error' do
            expect {invalid_auth.call}.to raise_error(ExceptionHandler::AuthenticationError, /Invalid credentials/)
          end
        end
      end
    end
  end
end
