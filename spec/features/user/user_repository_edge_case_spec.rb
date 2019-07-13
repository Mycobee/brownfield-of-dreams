# frozen_string_literal: true

require 'rails_helper'

feature 'Github Repository edge case testing' do
  before :each do
    @user1 = create(:user)
    @user1.token = Token.create(github_token: ENV['GITHUB_API_KEY_2'])

    @user2 = create(:user)
    @user2.token = Token.create(github_token: ENV['GITHUB_API_KEY'])

    @user3 = create(:user)
  end

  scenario 'user_1 returns expected repositories' do
    VCR.use_cassette('github/edgecase_repositories_1', allow_playback_repeats: true) do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)

      visit dashboard_path
      within '.github_section' do
        expect(page).to have_link('battleship_explosion')
      end
    end
  end

  scenario 'user_2 returns expected repositories' do
    VCR.use_cassette('github/edgecase_repositories_2', allow_playback_repeats: true) do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user2)

      visit dashboard_path
      within '.github_section' do
        expect(page).to have_link('book_club')
      end
    end
  end

  scenario 'user_3 returns no repositories' do
    VCR.use_cassette('github/edgecase_repositories_3', allow_playback_repeats: true) do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user3)

      visit dashboard_path
      expect(page).to_not have_selector('.github_section')
    end
  end
end
