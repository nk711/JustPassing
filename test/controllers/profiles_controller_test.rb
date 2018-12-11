require 'test_helper'

class ProfilesControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers
 
  #Sets up variables to be used in the test
  setup do
    @profile = profiles(:one)  #belongs to user one
    @profile2 = profiles(:two) #belongs to user two
    @user = users(:three) #Does not have a profile
    @user2 = users(:one)  #has profile one
  end

  #Clears the cache after every test
  teardown do
    # resets the cache
    Rails.cache.clear
  end

  #Get new profile form
  test "should get new" do
    get :new
    assert_response :redirect
  end

  #Create new profile [testing POST]
  test "should create profile" do
    sign_in @user
    assert_difference('Profile.count') do
      post :create, profile: @profile.attributes
    end
    assert_redirected_to profile_path(assigns(:profile))
    sign_out @user
  end

  #Get show profile form
  test "should show profile" do
    get :show, id: @profile
    assert_response :success
  end

  #Get edit profile form
  test "should get edit" do
    get :edit, id: @profile
    assert_response :redirect
  end

  #Updates profile form [testing PATCH]
  test "should update profile" do
    sign_in @user2
    patch :update, id: @profile, profile: {
          number: '02084932792'
      }
    assert_redirected_to profile_path(assigns(:profile))
    sign_out @user2
  end

  #deletes a profile form [testing DELETE]
  test "should destroy profile" do
    sign_in @user2
    assert_difference('Profile.count', -1) do
      delete :destroy, id: @profile
    end
    assert_redirected_to profiles_path
    sign_out @user2
  end

  #test that if the user without a profile tries to go to /posts/new he will jump back to root path
  test "User shouldnt be able to edits someone elses profile" do
    sign_in @user #user3 is not associated with post one
    get :edit, id: @profile2
    assert_redirected_to root_path
    sign_out @user
  end

  #test that if the user without a profile tries to go to /contact_seller he'll be jumped back to root path
  test "User should not be able to update someone elses profile" do
    sign_in @user #user3 is not associated with post one
     patch :update, id: @profile2, profile: {
          number: '02084932792'
     }
    assert_redirected_to root_path
    sign_out @user
  end

end
