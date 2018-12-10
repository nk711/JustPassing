# Preview all emails at http://localhost:3000/rails/mailers/contact_mailer
class ContactMailerPreview < ActionMailer::Preview
	def register_email
		ContactMailer.register_email(User.first)
	end
end
