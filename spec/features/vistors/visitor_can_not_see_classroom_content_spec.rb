require 'rails_helper'

feature "As a visitor on the root path" do
	scenario "I can't see classroom content on tutorial or welcome paths" do
		tutorial_1 = create(:tutorial, classroom: false)		
		tutorial_2 = create(:tutorial, classroom: true)		
		visit root_path		

		expect(page).to have_link(tutorial_1.title)
		expect(page).to_not have_link(tutorial_2.title)

		visit tutorial_path(tutorial_2)

		within '.alert-error' do
      page.should have_content("Page page_not_found doesn't exist")
    end

		visit tutorial_path(tutorial_1)
		expect(page).to have_link(tutorial_1.title)

		visit tutorials_path
		expect(page).to have_link(tutorial_1.title)
		expect(page).to_not have_link(tutorial_2.title)
	end
end
