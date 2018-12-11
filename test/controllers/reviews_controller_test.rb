require 'test_helper'

class ReviewsControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers
  
  #Does the following before every test
  setup do
    @review = reviews(:one) #review on profile one/user 1 CREATED  BY user 2
    @review2 = reviews(:two) #review on profile two/user 2 CREATED  BY user 1
    @profile = profiles(:one) #belongs to user one
    @user3 = users(:three) # Does not have profile
    @user2 = users(:two) # has profile two has review two
    @user1 = users(:one) # has profile one has review one

    sign_in @user2
  end

  #Clears the cache after every test
  teardown do
    # resets the cache
    Rails.cache.clear
  end

  test "should get index" do
    get :index, profile_id: @profile.id
    assert_response :success
    assert_not_nil assigns(:reviews)
  end

  test "should get new" do
    get :new, profile_id: @profile.id
    assert_response :success
  end

  #Signed in User should be able to create a review
  test "should create review" do
    assert_difference('Review.count') do
      post :create, :profile_id=>@profile.id, :review => @review.attributes
    end
    assert_redirected_to profile_path(@profile)
  end

  #Signed in User should be able to edit their a review
  test "should get edit" do
    get :edit, profile_id: @profile.id ,id: @review
    assert_response :success
  end
   #Signed in User should be able to edit their a review
  test "should update review" do
    patch :update, :profile_id=>@profile.id, :id => @review ,:review => {comment: 'updated comments'}
    assert_redirected_to profile_path(@profile)
  end

  test "should destroy review" do
    assert_difference('Review.count', -1) do
      delete :destroy, :profile_id=>@profile.id, :id => @review , :review=> @review
    end
    assert_redirected_to profile_path(@profile)
  end                     
end
