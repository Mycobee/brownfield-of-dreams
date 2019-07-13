# frozen_string_literal: true

# Registration email mailer for new users
class RegistrationNotifierMailer < ApplicationMailer
  def inform(user)
    @user = user
    mail(to: user.email, subject: 'Account Activation')
  end

  def invite(invited_user, sender)
    @invited_user = invited_user
    @sender = sender
    mail(to: invited_user.github_email, subject: 'Join the Field of Dreams')
  end
end
