# frozen_string_literal: true

#Registration email mailer for new users
class RegistrationNotifierMailer < ApplicationMailer
  def inform(user)
    @user = user
    mail(to: user.email, subject: 'Account Activation')
  end
end
