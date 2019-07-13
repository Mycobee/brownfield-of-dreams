require "rails_helper"

describe "as a registed user" do
  describe "On / dashboard when I click on send an invite" do
    before :each do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to \
      receive(:current_user).and_return(user)
    end
    it "takes me to /invite" do
      visit dashboard_path
      click_button("Send an Invite")
      expect(current_path).to eq(invite_index_path)
    end
  end
end
