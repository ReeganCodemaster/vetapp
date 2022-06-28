require 'rails_helper'

RSpec.describe 'Pets', type: :request do
  describe '/pets/create' do
    let(:user) { create(:user, role: 'owner')}
    let(:pet) {build(:pet)}
    let(:headers) {{'Authorization' => token_generator(user.id)}}
    let(:valid_attributes) { attributes_for(:pet, name: pet.name, animal: pet.animal ) }
    

    context 'when the request is valid ' do

      before { post '/pets/create', params:valid_attributes, headers: headers}

      it 'creates a new pet' do
        expect(response).to have_http_status(201)
      end

      it 'returns the user' do
        expect(json['id']).to eq(user.id)
      end
    end


    context 'when teh request is invalid' do

      before { post '/pets/create', params:{}, headers: headers}

      it 'does not create a new pet' do
        expect(response).to have_http_status(422)
      end

      it 'retruns a failure message' do
        expect(json['message']).to match(/Validation failed: Name can't be blank, Animal can't be blank/)
      end
    end
  end
end
