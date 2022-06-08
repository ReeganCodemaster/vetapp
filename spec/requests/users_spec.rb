require 'rails_helper'

RSpec.describe 'Users API' do
  let(:user) {build(:user)}
  let(:headers) { valid_headers.except('Authorization') }
  let(:valid_attributes) { attributes_for(:user, password_confirmation: user.password) }

  describe 'POST /signup' do
    context 'when the request is valid' do
      before { post '/signup', params:valid_attributes.to_json, headers: headers}
      
      it 'creates a new user' do
        expect(response).to have_http_status(201)
      end

      it 'returns a success mesage' do
        expect(json['message']).to  match(/Acount created succesfully/)
      end

      it 'returns a token' do
        expect(json['auth_token']).not_to be_nil
      end
    end
  end
end