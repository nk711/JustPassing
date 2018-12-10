require 'test_helper'

class ContactMailerTest < ActionMailer::TestCase
  # test "the truth" do
  #   assert true
  # end

  setup do
    @user = users(:one) # does have a profile
  end

  teardown do
    # resets the cache
    Rails.cache.clear
  end

  test 'should return email' do
  	mail = ContactMailer.register_email(@user);
  	assert.equal ['System@JustPassing.com'], mail.to
  	assert.equal ['System@JustPassing.com'], mail.from
  end

end
