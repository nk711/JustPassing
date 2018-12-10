class Post < ActiveRecord::Base
	belongs_to :user
	belongs_to :category

	
	scope :descending, -> {order(created_at: :desc)}

	#Validates the fields and checks if they are empty
    validates :title, :description, :price, :address_one, :city, :postal_code,
    :city, :postal_code, :phone_number, :category_id, :user_id, presence: true 


	validates :phone_number, format: { with: /\d{11}/, message: "Enter valid phone number" }

    validates :postal_code, format: { with: /([Gg][Ii][Rr] 0[Aa]{2})|((([A-Za-z][0-9]{1,2})|(([A-Za-z][A-Ha-hJ-Yj-y][0-9]{1,2})|(([A-Za-z][0-9][A-Za-z])|([A-Za-z][A-Ha-hJ-Yj-y][0-9][A-Za-z]?))))\s?[0-9][A-Za-z]{2})/,
    message: "Enter valid postal code" }

	has_attached_file :post_image, styles: { post_index: "300x300>", post_show: "300x300>" }, default_url: "/images/:style/missing.png"
 	validates :post_image,   :attachment_presence => true
 	validates_attachment_content_type :post_image, content_type: /\Aimage\/.*\z/
end
