require 'faker'

FactoryGirl.define do
  factory :recipe do
    name { Faker::Name.name }
    preparation_time { Faker::Number.within(range: 0.0..10.0) }
    cooking_time { Faker::Number.within(range: 0.0..10.0) }
    description { Faker::Hipster.paragraph }
    public { Faker::Boolean }
    user { recipe }
  end
end
