class UserDashboardFacade
	def initialize(id)
		@id = id
	end

	def repos
	  conn = Faraday.new(:url => 'https://api.github.com/user/repos') do |faraday| 
			faraday.adapter Faraday.default_adapter
		end

		response = conn.get do |req|
			req.headers['Authorization'] = 'token ' + ENV["GITHUB_API_KEY"]
		end
		
		repos = JSON.parse(response.body)[0..4]
		repos.map {|repo| Repo.new(repo)}
	end	
end
