require 'rails_helper'

describe "As a guest on the registration path who fills in all fields" do
	describe "I click submit and am redirected to the dashboard path" do
		scenario "I see a message that says logged in and email needs activated" do
			visit root_path

			click_on "Register"
		
			expect(current_path).to eq("/register")

			fill_in('user[email]', with: 'stringer525@gmail.com')
			fill_in('user[first_name]', with: 'test') 
			fill_in('user[last_name]', with: 'test')
			fill_in('user[password]', with: 'test')
			fill_in('user[password_confirmation]', with: 'test')

			click_button 'Create Account'

			expect(current_path).to eq(dashboard_path)
save_and_open_page
			expect(page).to have_content("Your activation email has been sent")
			expect(page).to have_content("This account has not yet been activated. Please check your email.")
		end	
	end
end

#As a guest user
#When I visit "/"
#And I click "Register"
#Then I should be on "/register"
#And when I fill in an email address (required)
#And I fill in first name (required)
#And I fill in first name (required)
#And I fill in password and password confirmation (required)
#And I click submit
#Then I should be redirected to "/dashboard"
#And I should see a message that says "Logged in as <SOME_NAME>"
#And I should see a message that says "This account has not yet been activated. Please check your email."
