# frozen_string_literal: true

#this facade presents data for the user dashboard
class UserDashboardFacade
  def initialize(user, token)
    @current_user = user
    @token = token
  end

  def repos(limit)
    return nil if @token.nil? || @token.github_token.nil?

    repos = github_service.find_repositories
    repo_objects = repos.map do |repo|
      Repository.new(repo)
    end
    repo_objects.take(limit)
  end

  def bookmarks
    User.bookmarks(@current_user)
  end

  def followers(limit)
    return nil if @token.nil? || @token.github_token.nil?

    followers = github_service.find_followers
    github_users = followers.map do |github_user|
      GithubUser.new(github_user)
    end
    github_users.take(limit)
  end

  def following(limit)
    return nil if @token.nil? || @token.github_token.nil?

    following = github_service.find_following
    github_users = following.map do |github_user|
      GithubUser.new(github_user)
    end
    github_users.take(limit)
  end

  def valid_friend?(github_user_email)
    friend = User.find_by(html_url: github_user_email)
    user_friends = @current_user.friends
    !friend.nil? && !user_friends.include?(friend)
  end

  def friends(limit)
    @current_user.friends.take(limit)
  end

  private

  def github_service
    @github_service ||= GithubService.new(@token.github_token)
  end
end
