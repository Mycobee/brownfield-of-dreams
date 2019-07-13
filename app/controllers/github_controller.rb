# frozen_string_literal: true

# controller for github oauth
class GithubController < ApplicationController
	def create
		token	= auth_hash['credentials']['token']
		current_user.token = Token.find_or_create_by(github_token: token)
		current_user.update(html_url: auth_hash["info"]["urls"]["GitHub"], \
		github_login: auth_hash[:info][:nickname], \
		github_email: auth_hash[:info][:email])
		redirect_to dashboard_path
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end
end
