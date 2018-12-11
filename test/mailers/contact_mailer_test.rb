require 'test_helper'

class ContactMailerTest < ActionMailer::TestCase
  # test "the truth" do
  #   assert true
  # end


  test 'should return email' do
  	maila = ContactMailer.register_email(User.first)
  	assert.equal ['System@JustPassing.com'], maila.to
  	assert.equal ['System@JustPassing.com'], maila.from
  end

  #Checks the content of the email
  test "should return contact email" do
      mail = ContactMailer.contact_us_email("nithesh@test.ac.uk", "nithesh", "02038482937", @message = "this is my message")
      assert_equal ['System@JustPassing.com'], mail.to
      assert_equal ['System@JustPassing.com'], mail.from
  end


end
