class Category < ActiveRecord::Base
	#Category belongs to a post
	belongs_to :post
	#field validated so that it is unique and must be present
	validates :name, uniqueness: true, presence: true
end
