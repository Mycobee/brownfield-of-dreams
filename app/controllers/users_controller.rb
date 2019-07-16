# frozen_string_literal: true

# user controller for new, create, account activation, and dashboard
class UsersController < ApplicationController
  def show
    render locals: {
      facade: UserDashboardFacade.new(current_user)
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
      notice = 'This account has not yet been activated. Please check your email.'
      flash[:email_notice] = 'Your activation email has been sent'
      flash[:activation_notice] = notice
      redirect_to dashboard_path
    else
      flash[:error] = 'Username already exists'
      render :new
     end
  end

  def update
    User.find(params[:id]).update(activated: true)
    redirect_to dashboard_path
    flash[:email_notice] = 'Thank you! Your account is now activated'
  end

  private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :password, :password_confirmation)
  end
end
