class Review < ActiveRecord::Base
	belongs_to :user
	belongs_to :profile
	validates :rating, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 5}
	validates :user_id, :profile_id, :comment, :rating, presence: true
end
