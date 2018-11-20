class AddFieldsToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :Firstname, :string, null: false
  	add_column :users, :lastname, :string, null: false
  	add_column :users, :number, :string, :length=>20, null: false  end
end
