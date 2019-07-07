class UserDashboardFacade
  def initialize(token)
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

  def followers
    followers = github_service.find_followers
    follower_objects = followers.map do |follower|
      Follower.new(follower)
    end
  end

  private

  def github_service
    GithubService.new(@token.github_token)
  end
end
