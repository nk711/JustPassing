class PagesController < ApplicationController
  #Contact action, displays the contact page
  def contact
  end

  #POST action, is called after the user submits the contact form
  #It is then checked to see if 
  def request_contact
    	name = params[:contact][:name]
    	email = params[:contact][:email]
    	telephone = params[:contact][:telephone]
    	message = params[:contact][:message]
    	#Checks if any of the fields are blank
    	#If there is, alert the user and do not send email
     if email.blank?
     	flash[:alert] = I18n.t('pages.request_contact.no_email')
     	#Otherwise send the email
     else
      ContactMailer.contact_us_email(email, name, telephone, message).deliver_now
     	flash[:notice] =I18n.t('pages.request_contact.email_sent')
     end
     #redirect to home page
     redirect_to root_path
  end

end
