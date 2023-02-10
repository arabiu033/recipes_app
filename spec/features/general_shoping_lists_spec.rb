require 'rails_helper'

RSpec.describe 'Food', type: :system do
  describe 'index page' do
    subject { FactoryGirl.create(:user, :confirmed) }
    before do
      5.times do
        FactoryGirl.create(:recipe, user: subject)
        FactoryGirl.create(:food, user: subject)
      end
    end

    it 'shows the right content' do
      visit '/users/sign_in'
      sleep(2)
      fill_in 'Email', with: subject.email
      sleep(2)
      fill_in 'Password', with: '123456'
      click_button 'Log in'
      expect(page).to have_current_path('/')
      sleep(2)
      visit general_shoping_lists_path
      sleep(5)
      expect(page).to have_content('Shopping List')
      expect(page).to have_content('Amount of food items')
      expect(page).to have_content(Food.find(1).name)
      expect(page).to have_content(Food.find(2).name)
      expect(page).to have_content(Food.find(3).name)
    end
  end
end
