require 'faker'

FactoryGirl.define do
  factory :recipe do
    name { Faker::Name.name }
    preparation_time { Faker::Number.decimal(l_digits: 1, r_digits: 1) }
    cooking_time { Faker::Number.decimal(l_digits: 1, r_digits: 1) }
    description { Faker::Hipster.paragraph_by_chars(characters: 356, supplemental: false) }
    public { Faker::Boolean }
    user { user }
  end
end
