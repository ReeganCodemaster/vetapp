FactoryBot.define do
  factory :vet do
    name { Faker::Name.name }
    email { 'foo@bar.com' }
    password { 'foobar' }
    role { 'vet' }
  end
end