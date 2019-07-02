class UserDashboardFacade
  def initialize(token)
    @token = token
  end

  def repositories(limit)
    repos = github_service.find_repositories
    repo_objects = repos.map do |repo|
      Repository.new(repo)
    end
    repo_objects.take(limit)
  end

  private

  def github_service
    GithubRepositories.new(@token)
  end
end
