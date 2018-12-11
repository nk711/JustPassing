require 'test_helper'

class ContactMailerTest < ActionMailer::TestCase
  # test "the truth" do
  #   assert true
  # end

  #Checks the content of the email
  test "should return contact email" do
      mail = ContactMailer.contact_us_email("nithesh@test.ac.uk", "nithesh", "02038482937", @message = "this is my message")
      assert_equal ['System@JustPassing.com'], mail.to
      assert_equal ['System@JustPassing.com'], mail.from
  end

  #Checks if the contant of the email
  test "should return contact email when a user sends an email to another user " do
      mail = ContactMailer.contact_email(
			'name',
			'email',
			'telephone',
			'seller@email.com',
			'posttitle',
			'message')
      assert_equal ['System@JustPassing.com'], mail.to
      assert_equal ['System@JustPassing.com'], mail.from
  end
  


end
