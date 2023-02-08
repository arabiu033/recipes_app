require 'faker'

FactoryGirl.define do
  factory :recipe_food do
    quantity { Faker::Number.decimal_part(digits: 2) }
    user { recipe }
  end
end
