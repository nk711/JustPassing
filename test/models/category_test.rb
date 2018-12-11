require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end



   #Cannot create a category with empty name field
  test 'should not save invalid category' do
    category = Category.new
    category.save
    refute category.valid?
  end

  #category with valid fields should be saved
  test 'should save valid category' do
  	category = Category.new
  	category.name = "Home"
  	category.save
  	assert category.valid?
  end

  #categories with name the same as another category should not be saved
  test 'should not save duplicate valid categories' do
    category1 = Category.new
    category1.name = "testduplicate"
    category1.save

    category2 = Category.new
    category2.name = "testduplicate"
    category2.save
    refute category2.valid?
  end

end
