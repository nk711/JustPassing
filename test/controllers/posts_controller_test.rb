require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers

  #Setting up some instance variables to used in the following tests
  setup do
    @user = users(:three) #does not have a profile
    @user2 = users(:one) # does have a profile    has post one
    @user3 =  users(:two) # does have a profile   has post two
    sign_in @user2

    @category = categories(:one)
    @post = posts(:one) #belongs to @user2
    @post.post_image =  File.new("test/fixtures/sample.jpg")
    @post.save
  end

  #Clears the cache after every test
  teardown do
    # resets the cache
    Rails.cache.clear
  end
 

  #Get index posts form
  test "should get index" do
    get :index
    assert_select "h3" , I18n.t('posts.index.myproject')
    assert_select "p" , I18n.t('posts.index.myappdescription')
    assert_response :success
   end


  #Get new posts form
  test "should get new" do
    get :new
    assert_select "h3" , I18n.t('posts.new.title')
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
    patch :update, id: @post, post: {phone_number: '02084932792'}
    assert_redirected_to post_path(assigns(:post))
  end

  #deletes a post form [testing DELETE]
  test "should destroy post" do
    assert_difference('Post.count', -1) do
      delete :destroy, id: @post
    end
    assert_redirected_to root_path
  end

  #test that if the user without a profile tries to go to /posts/new he will jump back to root path
  test "test must_make_acount private on new action" do
    sign_out @user2
    sign_in @user #user has no profile
    get :new
    assert_redirected_to new_profile_path
    sign_out @user
  end

  #test that if the user without a profile tries to go to /contact_seller he'll be jumped back to root path
  test "test must_make_acount private method on contact_seller action" do
    sign_out @user2
    sign_in @user #user has no profile
    get :contact_seller
    assert_redirected_to new_profile_path
    sign_out @user
  end

    #test that if a user can go to the edit page for someone elses post
  test "User shouldnt be able to edits someone elses post" do
    sign_out @user2
    sign_in @user3 #user3 is not associated with post one
    get :edit, id: @post
    assert_redirected_to post_path(@post)
    sign_out @user3
  end

  #test to see if a user can update someone elses post
  test "User should not be able to update someone elses post" do
    sign_out @user2
    sign_in @user3 #user3 is not associated with post one
    patch :update, id: @post, post: {phone_number: '02084932792'}
    assert_redirected_to post_path(@post)
    sign_out @user3
  end

  #tests whether a user can contact a seller without the need of a profile
  test "should not be able to contact seller if the user has no profile set up" do
    sign_out @user2
    sign_in @user #user has no profile
    post :contact_seller, mail: {
      user_name: 'Nithesh',
      user_email: 'nk00374@surrey.ac.uk',
      user_telephone: '02039475837',
      seller_user_email: 'xx02384@surrey.ac.uk',
      post_title: 'posttitle', 
      message:'this is my message'}
    assert_redirected_to new_profile_path
  end

  #testing if the user is able to contact a seller with no message
  test "should post contact seller but no fields" do
    post :contact_seller, mail: {}
    assert_response :redirect
    assert_not_empty flash[:alert]
    assert_nil flash[:notice]
  end

  #testing if the user is actually able to send a mail to the seller
  test "should post contact seller" do
    post :contact_seller, mail: {
      user_name: 'Nithesh',
      user_email: 'nk00374@surrey.ac.uk',
      user_telephone: '02039475837',
      seller_user_email: 'xx02384@surrey.ac.uk',
      post_title: 'posttitle', 
      message:'this is my message'}
    assert_response :redirect
    assert_nil flash[:alert]
    assert_not_empty flash[:notice]
  end

end
