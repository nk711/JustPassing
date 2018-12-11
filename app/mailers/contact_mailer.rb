class ContactMailer < ApplicationMailer
	#Takes in user parameters and sends email using method mail to the email address of user
	def register_email(user)
		@user = user
		mail cc: @user.email
	end

	#Allows a user to contact another user about a post
	# Ran into errors, Routing error, i believe it was because the routing was all wrong
	# since the url for the post kept showing /post/id when i specified /request-contact
	# i then proceeded to change the rooute to /post/id/request-contact, however this did not work
	# in order to save time this feature will be removed
	#
	def contact_email(user_name, user_email, user_telephone, seller_user_email, post_title, message)
		@user_name = user_name
		@user_email = user_email
		@user_telephone= user_telephone
		@seller_user_email = seller_user_email
	    @post_title = post_title
	    @message = message

	    
		mail cc: @seller_user_email
	end

	#This method will take in the parameters and then send an email 
	#This method is linked to the contact_us_email view
	def contact_us_email(email, name, telephone, msg)
		#Sets instance variables so they can be accessed in the view
		@email = email
		@name = name
		@telephone = telephone
		@message = msg
		#The email that we are going to send the email to
		mail cc: @email
	end
end
