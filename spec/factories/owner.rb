FactoryBot.define do
  factory :owner do
    name { Faker::Name.name }
    email { 'foo@bar.com' }
    password { 'foobar' }
    role { 'owner' }
  end
end