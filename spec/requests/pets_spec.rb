require 'rails_helper'

RSpec.describe 'Pets', type: :request do
  let(:user) { create(:user, role: 'owner')}
  let(:pet) { build(:pet) }
  let(:headers) {{'Authorization' => token_generator(user.id)}}
  
  
  describe '/pets/create' do
    context 'when the request is valid ' do

      let(:valid_attributes) { attributes_for(:pet, name: pet.name, animal: pet.animal ) }

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

  describe 'pets/:id/register' do
    let(:vet) { create(:user, role: 'vet')}
    let(:pet) { user.pets.create!(
      name: Faker::Name.name ,
      animal: Faker::Creature::Animal.name
    )}
    context 'when the request is valid' do
      let(:valid_attributes) { attributes_for(:pet, vet_email: vet.email) }

      before { post "/pets/#{pet.id}/register", params: valid_attributes, headers: headers }

      it ' creates a new registration' do
        expect(response).to have_http_status(201)
      end

      it 'returns the user' do 
        expect(json['id']).to eq(user.id)
      end
    end

    context 'when the  request is invalid' do
      before { post "/pets/#{pet.id}/register", params: {}, headers: headers }

      it 'does not create a pet' do
        expect(response).to have_http_status(422)
      end

      it 'retruns an error message' do
        expect(json['message']).to match(/Vet does't exist/)
      end
    end
  end
end
