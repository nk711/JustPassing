require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end

 
   test "should get index" do
    get :index

    assert_select 'title', 'change later'
    assert_select 'title', 'change later'
    assert_select 'title', 'My note'
    
    assert_response :success
   end

   test "should get index" do
    get :index
    assert_response :success
   end

   test "should get index" do
    get :index
    assert_response :success
   end


end
