require 'faker'

FactoryGirl.define do
  factory :food do
    name { Faker::Name.name }
    measurement_unit { Faker::Hipster.paragraph_by_chars(characters: 2, supplemental: false) }
    price { Faker::Number.decimal(l_digits: 2, r_digits: 2) }
    quantity { Faker::Number.decimal_part(digits: 2) }
    user { user }
  end
end
