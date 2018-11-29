class Profile < ActiveRecord::Base
	belongs_to :user
	has_many :reviews, dependent: :destroy
	
	validates :user_id, presence: true
end
