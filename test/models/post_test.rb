require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  setup do
  	@user = users(:one)
    @category = categories(:one)
  end

  #Checks if a valid post is successfully added into the database
  test 'should save valid post' do
  	new_post = Post.new
	  new_post.post_image = sample_file("sample.jpg")
  	new_post.title = "Test Post"
  	new_post.description = "Testing post"
  	new_post.price = "£138.89"
    new_post.category = @category
  	new_post.address_one = @user.profile.address_one
  	new_post.address_two =  @user.profile.address_two
  	new_post.address_three = @user.profile.address_three
  	new_post.city =  @user.profile.city
  	new_post.postal_code =  @user.profile.postal_code
  	new_post.phone_number =  @user.profile.number
  	new_post.user = @user
  	new_post.save
  	assert new_post.valid?
  end

#Empty attributes will not allow the post to be saved
 test 'should not save post with blank attributes' do
  	post = Post.new
	  post.post_image = sample_file("sample.jpg")
  	post.title = "Test Post"
  	post.description = ""
  	post.price = "£138.89"
  	post.address_one = ""
  	post.address_two =  @user.profile.address_two
  	post.address_three = @user.profile.address_three
  	post.city =  @user.profile.city
  	post.postal_code =  @user.profile.postal_code
  	post.phone_number =  @user.profile.number
  	post.user = @user
  	post.save
  	refute post.valid?
  end


#Test with invalid postal code
 test 'should not save post with invalid postal code' do
    post = Post.new
    post.post_image = sample_file("sample.jpg")
    post.title = "Test Post"
    post.description = ""
    post.price = "£138.89"
    post.address_one = ""
    post.address_two =  @user.profile.address_two
    post.address_three = @user.profile.address_three
    post.city =  @user.profile.city
    post.postal_code =  "SW8 WmS0"
    post.phone_number =  @user.profile.number
    post.user = @user
    post.save
    refute post.valid?
  end

#Test with invalid phone number
 test 'should not save post with invalid phone number' do
    post = Post.new
    post.post_image = sample_file("sample.jpg")
    post.title = "Test Post"
    post.description = "test descriptiom"
    post.price = "£138.89"
    post.address_one = "address lane"
    post.address_two =  @user.profile.address_two
    post.address_three = @user.profile.address_three
    post.city =  @user.profile.city
    post.postal_code =  @user.profile.postal_code
    post.phone_number =  "a6435er34353"
    post.user = @user
    post.save
    refute post.valid?
  end


end
