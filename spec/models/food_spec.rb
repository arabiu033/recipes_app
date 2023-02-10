require 'rails_helper'

RSpec.describe Food, type: :model do
  subject { Food.create(name: 'Owo', measurement_unit: 'gr', price: 10, quantity: 5) }
  user = FactoryGirl.create(:user, :confirmed)

  before { subject.save }

  it 'name must be there' do
    subject.name = nil
    subject.update(user:)
    subject.save
    expect(subject).to_not be_valid
  end

  it 'description must be there' do
    subject.price = nil
    subject.update(user:)
    subject.save
    expect(subject).to_not be_valid
  end

  it 'value of food items' do
    user = FactoryGirl.create(:user, :confirmed)
    subject.update(user:)
    subject.save
    expect(subject.quantity_value).to eql '5gr'
  end

  it 'price of food items' do
    user = FactoryGirl.create(:user, :confirmed)
    subject.update(user:)
    subject.save
    expect(subject.value_price).to eql '$50.0'
  end
end
