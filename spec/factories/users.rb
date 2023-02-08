require 'faker'

FactoryGirl.define do
  factory :user do
    name { Faker::Name.name }
    email { "#{Faker::Hipster.words(number: 1).join(' ')}@gmail.com" }
    password '123456'
  end
end
