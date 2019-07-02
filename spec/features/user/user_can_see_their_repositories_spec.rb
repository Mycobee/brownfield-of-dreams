# frozen_string_literal: true

require 'rails_helper'

describe 'User' do
  describe 'As a logged in user when I visit /dashboard' do
    before :each do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    end
    it "should have a section for 'Github'" do
      visit dashboard_path
      expect(page).to have_all_of_selectors(".github_section")
    end
  end
end
