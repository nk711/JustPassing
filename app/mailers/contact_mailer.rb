class ContactMailer < ApplicationMailer
	#Takes in user parameters and sends email using method mail to the email address of user
	def register_email(user)
		@user = user
		mail to: user.email, subject: t('.subject')
	end

	#Allows a user to contact another user about a post
	def contact_email(seller_user, user, post, message)
		@seller_user = seller_user
		@user = user
		@post = post
		@message = message

		mail cc: @seller_user
	end

end
