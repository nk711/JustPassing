class CreateModels < ActiveRecord::Migration
  def change
    create_table :models do |t|
      t.string :Review
      t.integer :rating
      t.text :comment

      t.timestamps null: false
    end
  end
end
