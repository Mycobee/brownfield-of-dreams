require 'rails_helper'

feature "On a tutorial show without a video" do
	scenario "it accounts for nil class error" do
		tutorial = create(:tutorial)
			
		visit tutorial_path(tutorial)
		
		within(".title-bookmark") do
			expect(page).to have_content("Tutorial Has No Videos")
		end
		expect(page).to_not have_selector('#player')
	end
end
