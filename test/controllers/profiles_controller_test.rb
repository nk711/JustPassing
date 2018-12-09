require 'test_helper'

class ProfilesControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers
 
  #Sets up variables to be used in the test
  setup do
    @profile = profiles(:one)
    @user = users(:three)
    @user2 = users(:one)
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
  end

  #deletes a profile form [testing DELETE]
  test "should destroy profile" do
    assert_difference('Profile.count', -1) do
      delete :destroy, id: @profile
    end
    assert_redirected_to profiles_path
  end
end
