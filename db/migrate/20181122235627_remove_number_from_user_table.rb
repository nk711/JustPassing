class RemoveNumberFromUserTable < ActiveRecord::Migration
  def change
  	remove_column :users, :number
  end
end
