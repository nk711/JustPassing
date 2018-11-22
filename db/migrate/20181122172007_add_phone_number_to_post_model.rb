class AddPhoneNumberToPostModel < ActiveRecord::Migration
  def change
  	  add_column :posts, :phone_number, :string, null: false, default: ''
  end
end
