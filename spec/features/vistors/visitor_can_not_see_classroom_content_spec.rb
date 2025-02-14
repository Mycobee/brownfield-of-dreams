# frozen_string_literal: true

require 'rails_helper'

feature 'As a visitor on the root path' do
  scenario "I can't see classroom content on tutorial or welcome paths" do
    tutorial1 = create(:tutorial, classroom: false)
    tutorial2 = create(:tutorial, classroom: true)
    visit root_path

    expect(page).to have_link(tutorial1.title)
    expect(page).to_not have_link(tutorial2.title)

    expected = ActionController::RoutingError
    expect { visit tutorial_path(tutorial2) }.to raise_error(expected)

    visit tutorial_path(tutorial1)
    expect(page).to have_content(tutorial1.title)

    visit tutorials_path
    expect(page).to have_link(tutorial1.title)
    expect(page).to_not have_link(tutorial2.title)
  end
end
