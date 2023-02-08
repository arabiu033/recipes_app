exit if !Rails.env.development?
require 'factory_girl_rails'

puts "Delete the data"

Recipe.delete_all
User.delete_all

puts "Create users"
a = Random.rand(8..15)
a.times do
  FactoryGirl.create(:user)
end

User.all.each do |user|
  a = Random.rand(3..8)
  a.times do
    FactoryGirl.create(:recipe, :user => user)
  end
end
