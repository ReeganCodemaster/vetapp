require 'rails_helper'

RSpec.describe "Authentications", type: :request do
  let!(:user) { create(:user) }
  let(:headers) { valid_heaaders.exept('Authorization')}
  let(:valid_credentials) do
    {
    email: user.email,
    password:user.password
    }.to_json
  let(:invalid_credentials) do
    {
      email: Faker::Internet.email,
      password: Faker::Internet.password
    }.to_json
  
    before {allow(request).to recieve(:headers)and_return(:headers)}
    context 'when the request is valid' do
      before { post 'auth/login', params: valid_credentials, headfers: headers}

      it 'returns an authentication token' do
        expect(response['auth_token']).not_to be_nil
      end
    end
  end
end
