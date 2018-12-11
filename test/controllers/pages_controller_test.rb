require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers
  test "should get contact" do
    get :contact
    assert_response :success
  end	
  #Checks if the email was not sent, since there are not fields
  test "should post request contact but no fields" do
	post :request_contact, contact: {}
	assert_response :redirect
	assert_not_empty flash[:alert]
	assert_nil flash[:notice]
  end
  #Checks if the email was set by checking if the flash value is not empty
  test "should post request contact" do
	post :request_contact,
	contact: {name: "Nithesh", email: "nithesh@me.com",
	telephone: "1234567890", message: "hiii"}
	assert_response :redirect
	assert_nil flash[:alert]
	assert_not_empty flash[:notice]
  end
end
