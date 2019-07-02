require 'rails_helper'

feature "User on dashboard" do
	scenario "sees Github section and 5 linked repos" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
			visit '/dashboard'
			within '#github-box' do
				expect(page).to have_content("Github Info:")

				
			end
	end
end
#As a logged in user
#When I visit /dashboard
#Then I should see a section for "Github"
#And under that section I should see a list of 5 repositories with the name of each Repo linking to the repo on Github
