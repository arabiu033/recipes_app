require 'faker'

FactoryGirl.define do
  factory :recipe_food do
    quantity { Faker::Number.decimal_part(digits: 2) }
    recipe { recipe }
    food { food }
  end
end
