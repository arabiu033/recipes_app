require 'faker'

FactoryGirl.define do
  factory :recipe_food do
    quantity { food.quantity }
    recipe { recipe }
    food { food }
  end
end
