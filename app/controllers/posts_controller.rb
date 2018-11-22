class PostsController < ApplicationController
	def index
	end

	def new
		#Defines an instance of a model which can be used in our view
		@post = Post.new
	end

	def create

	end

end
