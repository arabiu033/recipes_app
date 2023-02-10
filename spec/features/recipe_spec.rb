require 'rails_helper'

RSpec.describe 'Recipe', type: :system do
  describe 'index page' do
    subject { FactoryGirl.create(:user, :confirmed) }
    before do
      5.times do
        FactoryGirl.create(:recipe, user: subject)
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
      expect(page).to have_content('Recipes')
      expect(page).to have_content(Recipe.find(1).name)
      expect(page).to have_content(Recipe.find(2).name)
      expect(page).to have_content(Recipe.find(3).name)
      expect(page).to have_content(Recipe.first.description)
      click_link(Recipe.first.name)
      sleep(2)
      expect(page).to have_content('Preparation time')
    end
  end
end
