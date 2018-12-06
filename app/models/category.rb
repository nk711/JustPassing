class Category < ActiveRecord::Base
	belongs_to :post

	validates :name, uniqueness: true, presence: true
end
