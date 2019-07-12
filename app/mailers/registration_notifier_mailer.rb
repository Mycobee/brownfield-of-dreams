class RegistrationNotifierMailer < ApplicationMailer
	def inform(user)
    @user = user
binding.pry
    mail(to: user.email, subject: "Account Activation")
  end
end
