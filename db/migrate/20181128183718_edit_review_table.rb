class EditReviewTable < ActiveRecord::Migration
  def change
  	rename_column :reviews, :post_id, :profile_id
  end
end
