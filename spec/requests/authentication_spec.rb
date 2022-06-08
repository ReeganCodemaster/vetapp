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

  end
end
