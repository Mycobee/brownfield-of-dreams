require 'rails_helper'

feature "As a user on my dashboard" do
  before :each do
    @user = create(:user)
		@user.token = Token.create(github_token: ENV['GITHUB_API_KEY'])
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  end

	scenario "I see a button allowing me to connect to Github" do
		visit '/dashboard'

		expect(page).to_not have_selector(".github_section")
		click_button "Connect to Github"

		expect(current_path).to eq('/dashboard')
		expect(page).to have_selector(".github_section")
	end
end
