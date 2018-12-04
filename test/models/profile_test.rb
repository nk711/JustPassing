require 'test_helper'

class ProfileTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  setup do
  	@user = users(:three)
  end

  #Checks if a valid post is successfully added into the database
  test 'should save valid profile' do
  	profile = Profile.new
  	profile.first_name = "Bob"
  	profile.last_name = "biller"
  	profile.number =  "02937482636"
  	profile.address_one = "test lane4"
	  profile.city =  "cityyy"
	  profile.postal_code = "se4 2sn"
	  profile.user = @user 
  	profile.save
  	assert profile.valid?
  end

  #creating a profile with empty attribtues will not save the model
  test 'should not save profile with blank attributes' do
    profile = Profile.new
    profile.last_name = "biller"
    profile.address_one = "test lane4"
    profile.city =  "cityyy"
    profile.postal_code = "se4 2sn"
    profile.user = @user 
    profile.save
    refute profile.valid?
  end


  #creating a profile with invalid post code
  test 'should not save profile with invalid postal code' do
    profile = Profile.new
    profile.first_name = "Bob"
    profile.last_name = "biller"
    profile.number =  "02937482636"
    profile.address_one = "test lane4"
    profile.city =  "cityyy"
    profile.postal_code = "sASASdasdaa"
    profile.user = @user 
    profile.save
    refute profile.valid?
  end


  #creating a profile with invalid phone number
  test 'should not save profile with invalid phone number' do
    profile = Profile.new
    profile.first_name = "Bob"
    profile.last_name = "biller"
    profile.number =  "029sdasdasd36"
    profile.address_one = "test lane4"
    profile.city =  "cityyy"
    profile.postal_code = "se4 2sn"
    profile.user = @user 
    profile.save
    refute profile.valid?
  end


end
