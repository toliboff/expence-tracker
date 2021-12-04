require 'rails_helper'

RSpec.describe 'Groups', type: :feature do
  describe '#new page' do
    before do
      visit new_user_session_path
      fill_in 'Email', with: 'tolib@mail.com'
      fill_in 'Password', with: '123456'
      click_button 'Log In'
      click_link 'ADD CATEGORY'
    end

    it 'I can see the title of the page.' do
      expect(page).to have_content('NEW CATEGORY')
    end

    it 'should have input field' do
      expect(page).to have_selector('input')
    end

    it 'should have images for category icon' do
      expect(page).to have_selector('img')
    end

    it 'should add a new category' do
      fill_in 'Category name', with: 'Entertainment'
      find('#entertainment').click
      click_button 'Save'
      expect(current_path).to eq(user_groups_path(User.last))
    end
  end
end
