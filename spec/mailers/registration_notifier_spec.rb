require "rails_helper"

RSpec.describe RegistrationNotifierMailer, type: :mailer do
	it "Sends a registration email" do
		user = create(:user, email: "1234@ideclarethumbwar.com")
		email = RegistrationNotifierMailer.inform(user)

		expect(email.to.first).to eq(user.email)
		expect(email.subject).to eq("Account Activation")
		expect(email.body.encoded).to match(user.id.to_s)
	end

	it "Sends a invitaion email" do
		invited = create(:user, github_email: "1234@ideclarethumbwar.com")
		sender = create(:user, github_login: "ThumbWarrior")
		email = RegistrationNotifierMailer.invite(invited, sender)

		expect(email.to.first).to eq(invited.github_email)
		expect(email.subject).to eq("Join the Field of Dreams")
		expect(email.body.encoded).to match(invited.id.to_s)
	end
end
