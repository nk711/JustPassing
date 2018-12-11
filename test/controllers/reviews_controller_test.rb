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
  test "should get new" do
    get :new, profile_id: @profile.id
    assert_select "h1" , I18n.t('reviews.new.title')
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
    assert_select "h1" , I18n.t('reviews.edit.title')
    assert_response :success
  end
   #Signed in User should be able to edit their a review
  test "should update review" do
    patch :update, :profile_id=>@profile.id, :id => @review ,:review => {comment: 'updated comments'}
    assert_redirected_to profile_path(@profile)
  end

  #Signed in User should be able to destroy their own reviews
  test "should destroy review" do
    assert_difference('Review.count', -1) do
      delete :destroy, :profile_id=>@profile.id, :id => @review , :review=> @review
    end
    assert_redirected_to profile_path(@profile)
  end      

  #=========
  #Tesing whether an a user has set up a profile or not before some actions    
  test "should not let user with no profile go to new review action" do
    sign_out @user2
    sign_in @user3
    get :new, profile_id: @profile.id
    assert_redirected_to new_profile_path
  end

  #A user without a profile cannot go to a new review page
  test "should not let user with no profile have access to the new review action" do
    sign_out @user2
    sign_in @user3
    post :create, :profile_id=>@profile.id, :review => @review.attributes
    assert_redirected_to new_profile_path
  end

  #A user without a profile cannot go to the edit review page
  test "should not let user with no profile have access to the edit review action" do
    sign_out @user2
    sign_in @user3
    get :edit, profile_id: @profile.id ,id: @review
    assert_redirected_to new_profile_path
  end

   #A user without a profile cannot update at review
  test "should not let user with no profile have access to the update review action" do
    sign_out @user2
    sign_in @user3
    patch :update, :profile_id=>@profile.id, :id => @review ,:review => {comment: 'updated comments'}
    assert_redirected_to new_profile_path
  end

  #A user without a profile cannot destroy a review
  test "should not let user with no profile have access to the destroy review action" do
    sign_out @user2
    sign_in @user3
    delete :destroy, :profile_id=>@profile.id, :id => @review , :review=> @review
    assert_redirected_to new_profile_path
  end      

   #=========
  #Tesing whether an a user with a profile can have permissions for editing/creating/deleting reviews on their own profile
  test "should not let user go to the new review page from their profile page" do
    sign_out @user2
    sign_in @user1
    get :new, profile_id: @profile.id
    assert_redirected_to profile_path(@profile)
  end

  #A user without a profile cannot go to a new review page
  test "should not let user create a new review for their profile page" do
    sign_out @user2
    sign_in @user1
    post :create, :profile_id=>@profile.id, :review => @review.attributes
    assert_redirected_to profile_path(@profile)
  end

  #A user without a profile cannot go to the edit review page
  test "should not let user edit any of the reviews on their page" do
    sign_out @user2
    sign_in @user1
    get :edit, profile_id: @profile.id ,id: @review
    assert_redirected_to profile_path(@profile)
  end

   #A user without a profile cannot update at review
  test "should not let user update any reviews on their page" do
    sign_out @user2
    sign_in @user1
    patch :update, :profile_id=>@profile.id, :id => @review ,:review => {comment: 'updated comments'}
    assert_redirected_to profile_path(@profile)
  end

  #A user without a profile cannot destroy a review
  test "should not let user destroy a review on their" do
    sign_out @user2
    sign_in @user1
    delete :destroy, :profile_id=>@profile.id, :id => @review , :review=> @review
    assert_redirected_to profile_path(@profile)
  end      


end
