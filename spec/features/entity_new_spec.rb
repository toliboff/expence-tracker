require 'rails_helper'

RSpec.describe 'Entities', type: :feature do
  describe '#new page' do
    before do
      user = User.create(name: 'Tolib', email: 'tolib@mail.com', password: '123456' )
      Group.create(name: 'Foods', icon: 'food', user: User.last)
      Group.create(name: 'Education', icon: 'education', user: User.last)
      Group.create(name: 'Sport', icon: 'sport', user: User.last)

      visit new_user_session_path
      fill_in 'Email', with: 'tolib@mail.com'
      fill_in 'Password', with: '123456'
      click_button 'Log In'
      click_link 'Foods'
      click_link 'ADD TRANSACTION'
    end

    it 'I can see the title of the page.' do
      expect(page).to have_content('NEW TRANSACTION')
    end

    it 'should have input field for adding a name' do
      expect(page).to have_field('Transaction name')
    end

    it 'should have input field for adding an amount' do
      expect(page).to have_field('Amount')
    end

    it 'should have list of categories to select' do
      expect(page).to have_content('Categories')
      expect(page).to have_content('Foods')
      expect(page).to have_content('Education')
      expect(page).to have_content('Sport')
    end
  end
end
