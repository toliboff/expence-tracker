require 'rails_helper'

RSpec.describe 'User index page', type: :feature do
  describe '#index' do
    before do
      visit root_path
    end

    it { expect(page.body).to have_content('ExpenceTracker') }
    it { expect(page.body).to have_content('LOG IN') }

    
      it 'should redirect me to Login page' do
        click_link 'LOG IN'
        expect(current_path).to eq(new_user_session_path)
      end

      it 'should redirect me to Sign up page' do
        click_link 'SIGN UP'
        expect(current_path).to eq(new_user_registration_path)
      end
   end
end