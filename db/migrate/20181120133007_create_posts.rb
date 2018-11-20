class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.string :category, null: false
      t.string :price, null: false
      t.string :address_one, :length=>120, null: false
      t.string :address_two, :length=>120
      t.string :address_three, :length=>120
      t.string :city, :length=>100, null: false
      t.string :postal_code, :length=>16, null: false
      t.timestamps null: false
    end
  end
end