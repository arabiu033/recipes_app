exit if !Rails.env.development?
require 'factory_girl_rails'

puts "Delete the data"
RecipeFood.delete_all
Food.delete_all
Recipe.delete_all
User.delete_all

puts "Create users"
a = Random.rand(8..15)
a.times do
  FactoryGirl.create(:user, :confirmed)
end

User.all.each do |user|
  a = Random.rand(1..5)
  a.times do
    FactoryGirl.create(:recipe, :user => user)
    FactoryGirl.create(:food, :user => user)
  end
end

Recipe.all.each do |recipe|
  a = Random.rand(1..5)
  a.times do
    FactoryGirl.create(:recipe_food, :food => Food.all[Random.rand(0...Food.all.length)], :recipe => recipe)
  end
end