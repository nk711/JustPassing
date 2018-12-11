class Review < ActiveRecord::Base
	#A review belongs to a user
	belongs_to :user
	#A review also belongs to a profile
	belongs_to :profile
	#Validating the rating, it can only be a numebr that is 0<=x<=5
	validates :rating, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 5}
	#Validates fields so that they cant be null
	validates :user_id, :profile_id, :comment, :rating, presence: true
end
