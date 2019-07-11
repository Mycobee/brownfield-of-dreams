class RegistrationNotifierMailer < ApplicationMailer
	def inform(user, friend_contact)
    @user = user
    mail(to: friend_contact, subject: "Account Activation")
  end
end
