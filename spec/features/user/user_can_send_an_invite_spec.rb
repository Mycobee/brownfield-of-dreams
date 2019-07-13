require "rails_helper"

describe "as a registed user" do
  describe "On / dashboard when I click on send an invite" do
    before :each do
      user = create(:user)
      user.token = Token.new(github_token: ENV['GITHUB_API_KEY'])
      user_2 = create(:user)
      user.token = Token.new(github_token: ENV['GITHUB_API_KEY_2'])
      allow_any_instance_of(ApplicationController).to \
      receive(:current_user).and_return(user)
    end
    it "takes me to /invite" do
      visit dashboard_path
      click_link("Send an Invite")
      expect(current_path).to eq(invite_index_path)
    end
  end
  describe "On /invite" do
    it "allows us to send an invite" do
      fill_in("Github Handle", with: "Mycobee")
      click_button "Send Invite"
      expect(current_path).to eq(dashboard_path)
      expect(page).to have_content("Successfully sent invite!")
    end
  end
  describe "Invite sad path" do
    it "does not allow us to send an invite" do
      fill_in("Github Handle", with: "WHomer")
      click_button "Send Invite"
      expect(current_path).to eq(dashboard_path)
      expect(page).to have_content("Successfully sent invite!")
    end
  end
end
