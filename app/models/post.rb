class Post < ActiveRecord::Base
	enum catogory: [:Home, :Pets, :Property, :Job, :Motors, :Clothing, :Electronics, :other]
	
end
