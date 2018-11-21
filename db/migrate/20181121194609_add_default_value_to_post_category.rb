class AddDefaultValueToPostCategory < ActiveRecord::Migration
  def change
  	change_column :posts, :category, :string, :default => 'Other'
  end
end
