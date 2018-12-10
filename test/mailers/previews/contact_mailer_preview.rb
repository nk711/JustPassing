# Preview all emails at http://localhost:3000/rails/mailers/contact_mailer
class ContactMailerPreview < ActionMailer::Preview
	def register_email
		ContactMailer.with(user: User.first).register_email
	end
end
