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
      VCR.use_cassette("/github/dashboard", allow_playback_repeats: true) do
        visit dashboard_path
        click_link("Send an Invite")
        expect(current_path).to eq(invite_path)
      end
    end
  end

  describe "On /invite" do
    it "allows us to send an invite" do
      VCR.use_cassette("/github/dashboard", allow_playback_repeats: true) do
        visit(invite_path)
        fill_in("invite_github_handle", with: "Mycobee")
        click_button "Send Invite"
        expect(current_path).to eq(dashboard_path)
        expect(page).to have_content("Successfully sent invite!")
      end
    end
  end

  describe "Invite sad path" do
    it "does not allow us to send an invite" do
      VCR.use_cassette("/github/dashboard", allow_playback_repeats: true) do
        visit(invite_path)
        fill_in("invite_github_handle", with: "WHomer")
        click_button "Send Invite"
        expect(current_path).to eq(dashboard_path)
        expect(page).to have_content("Successfully sent invite!")
      end
    end
  end
end
