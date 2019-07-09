require 'rails_helper'

feature "As a visitor on the root path" do
	scenario "I shouldn't be able to see classroom content" do
		
		visit tutorials_path		
	end
end
