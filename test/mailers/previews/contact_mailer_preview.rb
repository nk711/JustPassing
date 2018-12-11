# Preview all emails at http://localhost:3000/rails/mailers/contact_mailer
class ContactMailerPreview < ActionMailer::Preview
	def register_email
		ContactMailer.register_email(User.first)
	end


	def contact_us_email
		ContactMailer.contact_us_email(
			"Nithesh@me.com",
			"Nithesh",
			"02030495837",
			"Hi would just like to ask......")
	end
end
