class PostsController < ApplicationController
	#
	before_action :find_post, only: [:show, :edit, :update, :destroy]

	def index
		@posts = Post.all.order("Created_at DESC")
	end

	def show

	end

	def edit

	end

	def destroy
		@post.destroy
		redirect_
	end
	def update
		if @book.update(post_params) 
			redirect_to post_path(@post)
		else
			render 'edit'
		end
	end

	def new
		#Defines an instance of a model which can be used in our view
		@post = Post.new
	end

	def create

		@post = Post.new(post_params)

		if @post.save
			#If the post saved succesfully then redirect to root path (index)
			redirect_to root_path
		else
			#else redirect to /posts/new route
			render 'new'
		end
	end

	private
		
		#populates the instance of a new post model from the form
		def post_params	
				params.require(:post).permit(
					:title,
					:description,
					:category,
					:price,
					:phone_number,
					:city,
					:address_one,
					:address_two,
					:address_three,
					:postal_code)
		end

		def find_post
			@post = Post.find(params[:id])
		end

end
