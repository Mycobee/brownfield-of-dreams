class SessionsController < ApplicationController
  def new
    @user ||= User.new
  end

  def create
		if !current_user.nil?
			client_id     = "586cd4146e2b7b6b2621"
  		client_secret = "6ba44bead24a403a61b05dbc84327e98368ca526"
  		code          = params[:code]
  		response      = Faraday.post("https://github.com/login/oauth/access_token?client_id=#{client_id}&client_secret=#{client_secret}&code=#{code}")
			pairs = response.body.split("&")

			response_hash = {}

    	pairs.each do |pair|
    		key, value = pair.split("=")
    		response_hash[key] = value
 			end

	  	token = response_hash["access_token"]

			oauth_response = Faraday.get("https://api.github.com/user?access_token=#{token}")

			auth = JSON.parse(oauth_response.body)

			if current_user.token.nil? || current_user.token.github_token.nil?
		 		current_user.token = Token.create(github_token: token) 
			elsif current_user.token.github_token != token 
				current_user.token.update(github_token: token)
			end
			redirect_to dashboard_path
		end

		if current_user.nil?
    	user = User.find_by(email: params[:session][:email]) || current_user
    	if user && user.authenticate(params[:session][:password])
    	  session[:user_id] = user.id
    	  redirect_to dashboard_path
    	else
    	  flash[:error] = "Looks like your email or password is invalid"
    	  render :new
    	end
		end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
