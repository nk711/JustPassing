class ContactMailer < ApplicationMailer
	default from: "System@JustPassing.com"

	#Takes in user parameters and sends email using method mail to the email address of user
	def register_email(user)
		@user = user
		mail to: user.email, subject: 'welcome to Just Passing'
	end

end
