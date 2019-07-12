# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    render locals: {
      facade: UserDashboardFacade.new(current_user, current_user.token)
    }
    # TODO: update with Oauth token
  end

  def new
    @user = User.new
  end

  def create
    user = User.create(user_params)
   if user.save
			RegistrationNotifierMailer.inform(user).deliver_now
      session[:user_id] = user.id
    	flash[:notice] = "Your activation email has been sent"
      redirect_to dashboard_path
    else
      flash[:error] = 'Username already exists'
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :password)
  end
end
