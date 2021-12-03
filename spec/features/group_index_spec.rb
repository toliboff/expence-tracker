require 'rails_helper'

RSpec.describe 'Groups', type: :feature do
  describe '#index page' do
    before do
      visit new_user_session_path
      User.create(name: 'Tolib', email: 'tolib@mail.com', password: '123456')
      
      Group.create(name: "Foods", icon:'food', user: User.last)
      Group.create(name: "Education", icon:'education', user: User.last)
      Group.create(name: "Sport", icon:'sport', user: User.last)

      fill_in 'Email', with: 'tolib@mail.com'
      fill_in 'Password', with: '123456'
      click_button 'Log In'

    end

    it 'I can see the the title of the page.' do
      expect(page).to have_content('CATEGORIES')
    end

    it 'I can see the list of categories.' do
      expect(page).to have_content('Foods')
      expect(page).to have_content('Education')
      expect(page).to have_content('Sport')
    end

    it 'I can see a button that lets me add a new category' do
      expect(page).to have_link('ADD CATEGORY')
    end

      it 'should redirect me to page for adding a new category' do
        click_link 'ADD CATEGORY'
        expect(current_path).to eq(new_user_group_path(User.last))
      end
   end
end