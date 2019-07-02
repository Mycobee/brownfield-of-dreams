class UserDashboardFacade
	def initialize(id)
		@id = id
	end

	def repos
	  conn = Faraday.new(:url => 'https://api.github.com/user/repos') do |faraday| 
			faraday.adapter Faraday.default_adapter
		end

		conn.get do |req|
			req.headers['Authorization'] = 'token' + ENV["GITHUB_API_KEY"]
		end
		repos = []
	end	
end
