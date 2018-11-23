class Post < ActiveRecord::Base
	belongs_to :user

	
	enum catogory: [:Home, :Pets, :Property, :Job, :Motors, :Clothing, :Electronics, :other]
	
	
end
