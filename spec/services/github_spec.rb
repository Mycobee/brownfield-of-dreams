require "rails_helper"

describe GithubRepositories do
  describe "repositories" do
    it "finds all CO members" do
      VCR.use_cassette("github_repositories") do
        service = GithubRepositories.new(ENV["GITHUB_TOKEN"])
        repositories = service.find_repositories
        repo = repositories.first

        expect(repositories.count).to eq(30)
        expect(repo[:name]).to eq("book_club")
        expect(repo[:html_url]).to eq("https://github.com/chakeresa/book_club")
      end
    end
  end
end
