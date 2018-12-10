class ContactMailer < ApplicationMailer
	#Takes in user parameters and sends email using method mail to the email address of user
	def register_email(user)
		@user = user
		mail to: user.email, subject: t('.subject')
	end

	#Allows a user to contact another user about a post
	# Ran into errors, Routing error, i believe it was because the routing was all wrong
	# since the url for the post kept showing /post/id when i specified /request-contact
	# i then proceeded to change the rooute to /post/id/request-contact, however this did not work
	# in order to save time this feature will be removed
	#
	#def contact_email(seller_user, user, post, message)
	#	@seller_user = seller_user
	#	@user = user
	#	@post = post
	#	@message = message
	#
	#	mail cc: @seller_user
	#end

end
