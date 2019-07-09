require 'rails_helper'

feature "On a tutorial show without a video" do
	scenario "it accounts for nil class error" do
		tutorial = create(:tutorial)
			
		visit tutorial_path(tutorial)
		
	end
end
