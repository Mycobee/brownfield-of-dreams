# frozen_string_literal: true

require 'rails_helper'

describe 'As a guest on the registration path who fills in all fields' do
  describe 'I click submit and am redirected to the dashboard path' do
    scenario 'I see a message that says logged in and email needs activated' do
      visit root_path

      click_on 'Register'

      expect(current_path).to eq('/register')

      fill_in('user[email]', with: 'stringer525@gmail.com')
      fill_in('user[first_name]', with: 'test')
      fill_in('user[last_name]', with: 'test')
      fill_in('user[password]', with: 'test')
      fill_in('user[password_confirmation]', with: 'test')

      click_button 'Create Account'

      email_expected = 'Your activation email has been sent'
      account_expected = 'This account has not yet been activated'
      expect(current_path).to eq(dashboard_path)
      expect(page).to have_content(email_expected)
      expect(page).to have_content(account_expected)
    end

    it 'updates user activation status when link is clicked', type: :request do
      user = create(:user)
      get "/users/#{user.id}"
      user.reload

      expect(user.activated).to be_truthy
    end
  end
end
