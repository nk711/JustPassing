class Review < ActiveRecord::Base
	belongs_to :user
	belongs_to :profile

	validates :user_id, :profile_id, :comment, :rating, presence: true
end
