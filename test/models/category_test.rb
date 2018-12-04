require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  #Categories would be added in the seeds.rb file
  test 'should save valid category' do
  	category = Category.new
  	category.name = "Home"
  	category.save
  	assert category.valid?
  end


end
