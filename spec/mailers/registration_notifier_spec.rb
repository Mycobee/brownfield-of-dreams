require "rails_helper"

RSpec.describe RegistrationNotifierMailer, type: :mailer do
	it "Sends a registration email" do
		user = create(:user, email: "1234@ideclarethumbwar.com")
		email = RegistrationNotifierMailer.inform(user)
		
		expect(email.to.first).to eq(user.email)
		expect(email.subject).to eq("Account Activation")
		expect(email.body.encoded).to match(user.id.to_s)
	end
end
