class Post < ActiveRecord::Base
	#Post belongs to a user and category
	belongs_to :user
	belongs_to :category
	#descending scope is defined to be used in the post controller
	scope :descending, -> {order(created_at: :desc)}
	#Validates the fields and checks if they are empty
    validates :title, :description, :price, :address_one, :city, :postal_code,
    :city, :postal_code, :phone_number, :category_id, :user_id, presence: true 
    #Validates the phone number checking if it has a valid phone number
	validates :phone_number, format: { with: /\d{11}/}
	#Validates the postal code checking if it has a valida email
    validates :postal_code, format: { with: /([Gg][Ii][Rr] 0[Aa]{2})|((([A-Za-z][0-9]{1,2})|(([A-Za-z][A-Ha-hJ-Yj-y][0-9]{1,2})|(([A-Za-z][0-9][A-Za-z])|([A-Za-z][A-Ha-hJ-Yj-y][0-9][A-Za-z]?))))\s?[0-9][A-Za-z]{2})/}
    #Sets up paper clip to be used within post
	has_attached_file :post_image, styles: { post_index: "300x300>", post_show: "300x300>" }, default_url: "/images/:style/missing.png"
	#validates an image, 
 	validates_attachment_content_type :post_image, content_type: /\Aimage\/.*\z/
end
