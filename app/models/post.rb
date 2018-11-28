class Post < ActiveRecord::Base
	belongs_to :user
	belongs_to :category

	scope :descending, -> {order(created_at: :desc)}

	has_attached_file :post_image, styles: { post_index: "300x300>", post_show: "300x300>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :post_image, content_type: /\Aimage\/.*\z/

end
