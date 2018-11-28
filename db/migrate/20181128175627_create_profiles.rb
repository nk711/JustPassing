class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :number, :length=>120
      t.string :address_one, :length=>120
      t.string :address_two, :length=>120
      t.string :address_three, :length=>120
      t.string :city, :length=>100
      t.string :postal_code, :length=>16
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
