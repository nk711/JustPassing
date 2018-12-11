class Profile < ActiveRecord::Base
	#profile belongs to a user
	belongs_to :user
	#can have many reviews, also dependent destroy so any reviews would be destroyed if profile was destroyed
	has_many :reviews, dependent: :destroy
	#Checks if the fields are present
	validates :user_id, :first_name, :last_name, :number, :address_one,
	:city, :postal_code, presence: true
	#Checks if the user id is unique
	validates :user_id, uniqueness: true
	#checks if phone number has a valid format
	validates :number, format: { with: /\d{11}/, message: "Enter valid phone number" }
	#checks if post code has a valid format
    validates :postal_code, format: { with: /([Gg][Ii][Rr] 0[Aa]{2})|((([A-Za-z][0-9]{1,2})|(([A-Za-z][A-Ha-hJ-Yj-y][0-9]{1,2})|(([A-Za-z][0-9][A-Za-z])|([A-Za-z][A-Ha-hJ-Yj-y][0-9][A-Za-z]?))))\s?[0-9][A-Za-z]{2})/,
    message: "Enter valid post code" }

end
