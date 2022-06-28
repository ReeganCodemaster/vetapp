FactoryBot.define do
  factory :pet do
    name { Faker::Name.name }
    animal {Faker::Creature::Animal.name}
  end
end