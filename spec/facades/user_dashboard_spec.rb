# frozen_string_literal: true

require 'rails_helper'

describe UserDashboardFacade do
  before :each do
    user = create(:user)
    user.token = Token.create(github_token: ENV['GITHUB_API_KEY'])
    @test_facade = UserDashboardFacade.new(user)
  end

  it 'exists' do
    # TODO: update with Oauth token
    expect(@test_facade).to be_a(UserDashboardFacade)
  end

  it '#repos' do
    VCR.use_cassette('github/github_repositories', allow_playback_repeats: true) do
      expect(@test_facade.repos(2)).to be_a(Array)
      expect(@test_facade.repos(2).first).to be_a(Repository)
      expect(@test_facade.repos(2).first.name).to eq('book_club')
    end
  end

  it '#followers' do
    VCR.use_cassette('github/followers', allow_playback_repeats: true) do
      expect(@test_facade.followers(2)).to be_a(Array)
      expect(@test_facade.followers(2).first).to be_a(GithubUser)
      expect(@test_facade.followers(2).first.login).to eq('Loomus')
    end
  end

  it '#following' do
    VCR.use_cassette('github/following', allow_playback_repeats: true) do
      expect(@test_facade.following(1)).to be_a(Array)
      expect(@test_facade.following(1).first).to be_a(GithubUser)
      expect(@test_facade.following(1).first.login).to eq('DragonQuills')
    end
  end
end
