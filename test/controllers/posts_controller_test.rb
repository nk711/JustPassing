require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end

  def create_user 
    

  end
  
 
   test "should get index" do
    get :index

    
    assert_response :success
   end


  test "should post request contact but no email" do
    post :request_contact

    assert_response :redirect
    assert_not_empty flash[:alert]
    assert_nil flash[:notice]
  end

  test "should post request contact" do
    post :request_contact,
    name: "Matthew", email: "matthew@me.com",
    telephone: "1234567890", message: "Hello"

    assert_response :redirect
    assert_nil flash[:alert]
    assert_not_empty flash[:notice]
  end

end
