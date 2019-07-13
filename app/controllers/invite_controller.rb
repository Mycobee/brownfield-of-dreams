class InviteController < ApplicationController
  def new
  end

  def create
    invited_user = User.find_by(github_login: params[:invite][:github_handle])
    if invited_user.nil? || invited_user.github_email.nil?
      flash[:warning] = "The Github user you selected doesn't have an email address associated with their account."
    else
      RegistrationNotifierMailer.invite(invited_user, current_user).deliver_now
      flash[:notice] = "Successfully sent invite!"
    end
    redirect_to(dashboard_path)
  end
end
