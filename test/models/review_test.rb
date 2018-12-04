require 'test_helper'

class ReviewTest < ActiveSupport::TestCase
  setup do
  	@user = users(:one)
  end

  #Checks if a valid profile is successfully added into the database
  test 'should save valid profile' do
  	review = Review.new
  	review.rating = 4
  	review.comment = "this is my comment"
  	review.user = @user
    review.profile = @user.profile
  	review.save
  	assert review.valid?
  end

  #Checks if a profile can be saved with blank attributes
  test 'should not save profile with blank attributes' do
  	review = Review.new
  	review.comment = "this is my comment"
  	review.user = @user
  	review.save
  	refute review.valid?
  end

  #Rating should only be numeric
  test 'should not save profile with wrong rating format' do
  	review = Review.new
  	review.rating = "sdasd"
  	review.comment = "this is my comment"
  	review.user = @user
    review.profile = @user.profile
  	review.save
  	refute review.valid?
  end


end
