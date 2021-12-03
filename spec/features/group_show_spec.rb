require 'rails_helper'

RSpec.describe 'Groups', type: :feature do
  describe '#show page' do
    before do
      visit new_user_session_path
      @food = Group.find_by(name:'Foods')
      entity = Entity.create(name: 'Pizza', amount: 12, author: User.last)  
      entity.group_ids = @food.id

      fill_in 'Email', with: 'tolib@mail.com'
      fill_in 'Password', with: '123456'
      click_button 'Log In'
      click_link 'Foods'

    end

    it 'I can see the title of the page.' do
      expect(page).to have_content('TRANSACTIONS')
    end

    it 'I can see the total amount of transactions for selected category.' do
      expect(page).to have_content('Foods (total amount)')
    end

    it 'I can see the transaction and amount of transaction for selected category.' do
      expect(page).to have_content('Pizza')
      expect(page).to have_content('$12.00')
    end

    it 'I can see a button that lets me add a new transaction' do
      expect(page).to have_link('ADD TRANSACTION')
    end

      it 'should redirect me to page for adding a new transaction' do
        click_link 'ADD TRANSACTION'
        expect(current_path).to eq(new_user_group_entity_path(User.last, @food.id))
      end
   end
end