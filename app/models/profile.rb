class Profile < ActiveRecord::Base
	belongs_to :user
	has_many :reviews, dependent: :destroy
	
	validates :user_id, :first_name, :last_name, :number, :address_one,
	:city, :postal_code, presence: true

	validates :user_id, uniqueness: true

	validates :number, format: { with: /\d{11}/, message: "Enter valid phone number" }

    validates :postal_code, format: { with: /([Gg][Ii][Rr] 0[Aa]{2})|((([A-Za-z][0-9]{1,2})|(([A-Za-z][A-Ha-hJ-Yj-y][0-9]{1,2})|(([A-Za-z][0-9][A-Za-z])|([A-Za-z][A-Ha-hJ-Yj-y][0-9][A-Za-z]?))))\s?[0-9][A-Za-z]{2})/,
    message: "Enter valid post code" }

end
