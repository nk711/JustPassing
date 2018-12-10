require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers

  setup do
    @user = users(:three) #does not have a profile
    @user2 = users(:one) # does have a profile
    sign_in @user2

    @category = categories(:one)
    @post = posts(:one)
    @post.post_image =  File.new("test/fixtures/sample.jpg")
    @post.save
  end

  #Get index posts form
  test "should get index" do
    get :index
    assert_response :success
   end


  #Get new posts form
  test "should get new" do
    get :new
    assert_response :success
  end

  #Create new post [testing POST]
  test "should create post" do
    assert_difference('Post.count') do
      post :create, post: @post.attributes
    end
    assert_redirected_to root_path
  end

  #Get show post form
  test "should show post" do
    get :show, id: @post
    assert_response :success
  end

  #Get edit post form
  test "should get edit" do
    get :edit, id: @post
    assert_response :success
  end

  #Updates post form [testing PATCH]
  test "should update post" do
    patch :update, id: @post, post: {
          phone_number: '02084932792'
      }
    assert_redirected_to root_path
  end

  #deletes a post form [testing DELETE]
  test "should destroy post" do
    assert_difference('Post.count', -1) do
      delete :destroy, id: @post
    end
    assert_redirected_to root_path
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
