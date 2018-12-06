require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  #Cannot create a user with empty fields
  test 'should not save invalid user' do
	  user = User.new
	  user.save
	  refute user.valid?
  end
  

  #Can create a user as long as all the fields are supplied
  test 'should save valid user' do
	  user = User.new
	  user.email = 'bob@example.com'
	  user.password = '12345678'
	  user.save
	  assert user.valid?
  end

  #Cannot create a user with the same email address
  test 'should not save valid user with the same email address' do
	  user1 = User.new
	  user1.email = 'bob@example.com'
	  user1.password = '12345678'
	  user1.save

	  user11 = User.new
	  user11.email = 'bob@example.com'
	  user11.password = '12345678'
	  user11.save
	  refute user11.valid?
  end


end
