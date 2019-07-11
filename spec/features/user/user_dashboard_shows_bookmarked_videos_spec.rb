require "rails_helper"

describe "As a logged in user When I visit '/dashboard'" do
  before :each do
    user = create(:user)
    @tutorial_1 = create(:tutorial)
    @video_1 = create(:video)
    @tutorial_1.videos << @video_1
    @tutorial_2 = create(:tutorial)
    @video_3 = create(:video)
    @video_4 = create(:video)
    @video_2 = create(:video)
    @tutorial_2.videos << @video_3
    @tutorial_2.videos << @video_4
    @tutorial_2.videos << @video_2
    user.videos << @video_1
    user.videos << @video_2
    user.videos << @video_3
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  end

  it "shows a list of all bookmarked segments under the Bookmarked Segments section" do
    VCR.use_cassette("github/dashboard", allow_playback_repeats: true) do
      visit dashboard_path
      within(".bookmarks_section") do
        expect(page).to have_all_of_selectors("#tutorial_#{@tutorial_1.id}_section", "#tutorial_#{@tutorial_2.id}_section")
      end
    end
  end

  it "shows videos organized by which tutorial they are a part of" do
    VCR.use_cassette("github/dashboard", allow_playback_repeats: true) do
      visit dashboard_path
      within("#tutorial_#{@tutorial_1.id}_section") do
        expect(page).to have_all_of_selectors("#video_#{@video_1.id}")
      end
      within("#tutorial_#{@tutorial_2.id}_section") do
        expect(page).to have_all_of_selectors("#video_#{@video_2.id}", "#video_#{@video_3.id}")
      end
    end
  end

  it "shows videos should be ordered by their position" do
    VCR.use_cassette("github/dashboard", allow_playback_repeats: true) do
      visit dashboard_path
      expect(page.all(".video_frame")[0]).to have_selector("#video_#{@video_1.id}")
      expect(page.all(".video_frame")[1]).to have_selector("#video_#{@video_3.id}")
      expect(page.all(".video_frame")[2]).to have_selector("#video_#{@video_2.id}")
    end
  end
end
