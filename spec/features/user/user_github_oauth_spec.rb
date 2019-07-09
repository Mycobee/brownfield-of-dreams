# frozen_string_literal: true

require 'rails_helper'

feature 'github oauth' do
  before :each do
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new(
      provider: 'github',
      credentials: { token: ENV['GITHUB_API_KEY'] }
    )
    @user = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end

  it 'Starts without github access and grants after oauth' do
    VCR.use_cassette('github/oauth') do
      visit dashboard_path

      expect(page).to_not have_selector('.github_section')

      click_link('Connect to Github')

      expect(current_path).to eq(dashboard_path)

      expect(page).to have_selector('.github_section')
    end
  end
end
