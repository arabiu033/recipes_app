require 'rails_helper'

RSpec.describe Recipe, type: :model do
  subject { FactoryGirl.create(:recipe, user: FactoryGirl.create(:user, :confirmed)) }

  before { subject.save }

  it 'name must be there' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'description must be there' do
    subject.description = nil
    expect(subject).to_not be_valid
  end

  it 'count of food items' do
    user = FactoryGirl.create(:user, :confirmed)
    food = FactoryGirl.create(:food, user:)
    subject.update(user:)
    subject.save
    RecipeFood.create(quantity: 5, recipe: subject, food:)
    expect(subject.total_food_items).to eql 1
  end

  it 'price of food items' do
    user = FactoryGirl.create(:user, :confirmed)
    food = Food.create(name: 'Owo', measurement_unit: 'gr', price: 10, quantity: 5, user:)
    subject.update(user:)
    subject.save
    RecipeFood.create(quantity: 5, recipe: subject, food:)
    expect(subject.total_price).to eql 50
  end
end
