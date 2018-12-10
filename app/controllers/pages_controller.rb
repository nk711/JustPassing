class PagesController < ApplicationController
  #Contact action, displays the contact page
  def contact
  end

  #POST action, is called after the user submits the contact form
  #It is then checked to see if 
  def request_contact
  	name = params[:name]
  	email = params[:email]
  	telephone = params[:telephone]
  	message = params[:message]
  	#Checks if any of the fields are blank
  	#If there is, alert the user and do not send email
   if email.blank? || message.blank? || name.blank? || telephone.blank?
   	flash[:alert] = I18n.t('pages.request_contact.no_email')
   	#Otherwise send the email
   else
   	flash[:notice] =I18n.t('pages.request_contact.email_sent')
   end
   redirect_to root_path
  end

end
