class PostsController < ApplicationController
	#runs the find_post method before the selected methods
	before_action :find_post, only: [:show, :edit, :update, :destroy, :request_contact]
	before_action :authenticate_user!, only: [:edit, :destroy, :update, :new, :create, :request_contact]
	before_action :must_make_account, only: [:new, :create, :request_contact]
	before_action :check, only: [:edit, :update, :destroy,]
	#Represents the index action
	#This will list all the posts depending on the selected category/query
	def index
		if params[:category].blank?
			@posts = Post.all.descending
		else
			@category_id = Category.find_by(name: params[:category]).id
			posts = Post.where(:category_id => @category_id).descending
			# Splits the array into further arrays which would represent rows, the rows will then 
			# be displayed on the index page

		end
	end

	#Represents the show action, allows the user to view a particular post
	def show
		#no need to redirect user here
	end

	#Represents the edit action, allows the creator to edit their psot
	def edit
	end

	#Represents the destroy action, only allows the creator to destroy their post
	def destroy
		if @post.destroy
			flash[:notice] = t('.success')
			redirect_to root_path
		else 
			flash[:notice] = t('.fail')
			render :show
		end
	end

	#Represents the Update aciton, only allows the creator to update their post
	def update
		#If the update doesnt include the category then do not try to update the category
		unless (post_params[:category_id]==nil)
			#else update it if the category parameter is not null...
			@post.category = Category.find(post_params[:category_id].to_i)
		end
		#Now update the post
		if @post.update(post_params) 
			#Redirect to the updated post (show)
			redirect_to post_path(@post)
		else
			render :edit
		end
	end

	#Represents the new action, only allows users with a profile to create a new post
	def new
		#Defines an instance of a model which can be used in our view
		#@post = Post.new
		@post = current_user.posts.build
		#Gets all the catogories
	end

	#Represents the create action, only allows users with a set up profile to create a new post
	def create
		#@post = Post.new(post_params)
		@post =current_user.posts.build(post_params)
		@post.category = Category.find(post_params[:category_id].to_i)
		if @post.save
			#If the post saved succesfully then redirect to root path (index)
			redirect_to root_path
		else
			#else redirect to /posts/new route
			render :new
		end
	end

	#This feature failed to work, to reduce time waste it'll be removed and a contact page
	#will be added instead
	#The request_contact action allows the user to send an email to the seller/post-creator
	def contact_seller
		mail_user_name = params[:mail][:user_name] #User object
		mail_user_email = params[:mail][:user_email] #User object
		mail_user_telephone = params[:mail][:user_telephone] #User object
		mail_seller_email = params[:mail][:seller_user_email]#Seller user object
		mail_post_title = params[:mail][:post_title] #currently viewed post object
		mail_message = params[:mail][:message] #the message
		#If the messages are blank then dont sent the mail
		# Else send the email!
		if mail_message.blank?
			flash[:alert] = I18n.t('posts.request_contact.no_message')
		else
			#sending email
			ContactMailer.contact_email(mail_user_name, mail_user_email, mail_user_telephone,mail_seller_email ,mail_post_title, mail_message).deliver_now
			flash[:notice] = I18n.t('posts.request_contact.email_sent')
		end

		# Redirect to root path (ie home page)
		redirect_to root_path
	end



	private
		#Strong parameter!
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

		#Checks to see if the current user has set up a profile before the editing/creating/updating/deleting/contacting actions
		def must_make_account
			#Checks if profile is nil, ie hasnt been set up
			if user_signed_in?
				if current_user.profile==nil
    		 		flash[:notice] = t('posts.edit.alertnew')
     		 		redirect_to post_path(@post)
      				return
      			end
      		end
      		#Gets redirected back to the post show page
      	end

      	#Checks to see if the current user is the creator of the post before the editing/updating/deleting/ actions
      	def check
      		if user_signed_in?
	      		unless current_user.id == @post.user_id
	    		 flash[:notice] = t('posts.edit.alertno')
	     		 redirect_to post_path(@post)
	      		 return
	      		end
	      	end
      		#Gets redirected back to the post show page
      	end
		
      	#Finds the post with the parameter id passed in
      	# Also finds the user who is associated with the post
		def find_post
			@post = Post.find(params[:id])
			@seller = User.find(@post.user.id)
		end
	

end
