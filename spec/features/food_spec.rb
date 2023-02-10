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
      visit foods_path
      expect(page).to have_content('Foods')
      expect(page).to have_content(Food.find(1).name)
      expect(page).to have_content(Food.find(2).name)
      expect(page).to have_content(Food.find(3).name)
      click_link('New Food')
      sleep(2)
      expect(page).to have_current_path('/foods/new')
    end
  end
end
