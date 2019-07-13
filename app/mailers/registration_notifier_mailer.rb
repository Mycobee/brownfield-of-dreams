class RegistrationNotifierMailer < ApplicationMailer
	def inform(user)
    @user = user
    mail(to: user.email, subject: "Account Activation")
  end
end
