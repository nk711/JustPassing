class ContactMailer < ApplicationMailer
	#Takes in user parameters and sends email using method mail to the email address of user
	#been removed for now..
	def register_email(email)
		@email = email
		mail cc: @email
	end

	#Allows a user to contact another user about a post
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
