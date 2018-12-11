# Preview all emails at http://localhost:3000/rails/mailers/contact_mailer
class ContactMailerPreview < ActionMailer::Preview

	#Tests the preview for the contact_email method in mailers
	def contact_email
		ContactMailer.contact_email(
			'name',
			'email',
			'telephone',
			'seller@email.com',
			'posttitle',
			'message')
	end

	#Tests the preview for the contact_us_email method in mailers
	def contact_us_email
		ContactMailer.contact_us_email(
			"Nithesh@me.com",
			"Nithesh",
			"02030495837",
			"Hi would just like to ask......")
	end
end
