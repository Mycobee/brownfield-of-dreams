require 'rails_helper'

feature "As a visitor on the root path" do
	scenario "I shouldn't be able to see classroom content" do
		tutorial_1 = create(:tutorial, classroom: false)		
		tutorial_2 = create(:tutorial, classroom: true)		
		visit root_path		

		expect(page).to have_link(tutorial_1.title)
		expect(page).to_not have_link(tutorial_2.title)
	end
end
