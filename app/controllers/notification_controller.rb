class NotificationController < ApplicationController
	def create
		RegistrationNotifierMailer.inform(current_user, params[:email]).deliver_now
    flash[:notice] = "Your activation email has been sent"
    redirect_to root_url
	end
end
