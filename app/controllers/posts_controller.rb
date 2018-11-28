class PostsController < ApplicationController
	#runs the find_post method before the selected methods
	before_action :find_post, only: [:show, :edit, :update, :destroy]



	def index
		if params[:category].blank?
			@posts = Post.all.descending
		else
			@category_id = Category.find_by(name: params[:category]).id
			@posts = Post.where(:category_id => @category_id).descending
		end
	end

	def show

	end

	def edit
		@list = Category.all.map{ |c| [c.name, c.id]}

	end

	def destroy
		if @post.destroy
			flash[:notice] = t('.success')
			redirect_to root_path
		else 
			flash[:notice] = t('.fail')
			render :show
		end
	end

	def update
		@post.category_id = params[:category_id]
		if @post.update(post_params) 
			redirect_to post_path(@post)
		else
			render :edit
		end
	end

	def new
		#Defines an instance of a model which can be used in our view
		#@post = Post.new
		@post = current_user.posts.build
		#Gets all the catogories
		@list = Category.all.map{ |c| [c.name, c.id]}
	end

	def create

		#@post = Post.new(post_params)
		@post =current_user.posts.build(post_params)
		@post.category_id = params[:category_id]

		if @post.save
			#If the post saved succesfully then redirect to root path (index)
			redirect_to root_path
		else
			#else redirect to /posts/new route
			render :new
		end
	end

	private
		
		#populates the instance of a new post model from the form
		def post_params	
				params.require(:post).permit(
					:post_image,
					:title,
					:description,
					:price,
					:phone_number,
					:city,
					:address_one,
					:address_two,
					:address_three,
					:postal_code,
					:category_id)
		end

		def find_post
			@post = Post.find(params[:id])
		end

end
