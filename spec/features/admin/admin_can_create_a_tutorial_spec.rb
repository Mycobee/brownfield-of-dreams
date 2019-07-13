require "rails_helper"

describe "As an admin when I visit /admin/tutorials/new" do
  scenario "I am able to create a new tutorial" do
    admin = create(:user, role: 1)
    allow_any_instance_of(ApplicationController).to \
    receive(:current_user).and_return(admin)

    visit new_admin_tutorial_path

    fill_in 'tutorial[title]', with: 'meaningful name'
    fill_in 'tutorial[description]', with: 'some content'
    fill_in 'tutorial[thumbnail]', with: 'J7ikFUlkP_k'
    click_on 'Save'

    new_tutorial = Tutorial.last
    expect(current_path).to eq(tutorial_path(new_tutorial.id))
    expect(page).to have_content("Successfully created tutorial.")
  end
end
