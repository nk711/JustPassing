class ReviewsController < ApplicationController
  #Sets the review
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  #Checks if the user is signed in as well
  #Users with no profile set up can onl VIEW a profile page
  #Prevents the user from having control of the review section of their own account
  before_action :same_account, :authenticate_user!, :must_make_account, only: [:new, :edit, :create, :update, :destroy, ]
  #Finds the currently viewed profile
  before_action :find_profile
  #The index action which displays all the reviews onto a form
  def index
    @reviews = Review.all
  end
  #The new action allows the user to create a new review
  def new
    @review = Review.new
  end
  #The edit action allows the user to edit a review
  def edit
  end
  #The create action allows the user to create a review
  def create
    #Takes in the parameters and builds a review
    @review = @profile.reviews.build(review_params)
    #Adds the user id
    @review.user_id = current_user.id
    #Now checks whether the review is saved and redirects the user accordingly
    respond_to do |format|
      if @review.save
          format.html { redirect_to @profile, notice: I18n.t('reviews.create.success') }
          format.json { render :show, status: :created, location: @review }
      else
          format.html { redirect_to  new_profile_review_path, notice: I18n.t('reviews.create.fail') }
          format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end
  #The update action allows the user to make changes to the review
  def update
    #Checks whether the update was successful and redirects the user accordingly
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to profile_path(@profile), notice: I18n.t('reviews.update.success')}
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit , notice: I18n.t('reviews.update.fail') }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # The destroy action allows the user to delete a post they have posted
  def destroy
    respond_to do |format|
      if @review.destroy
        format.html { redirect_to profile_path(@profile), notice: I18n.t('reviews.destroy.success')}
        format.json { head :no_content }
      else 
        flash[:notice] = I18n.t('reviews.destroy.fail')
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(
      :rating,
       :comment)
    end

    #Checks to see if the current user has set up a profile before the editing/creating/updating/deleting/contacting actions
    def must_make_account
    #Checks if profile is nil, ie hasnt been set up
    if user_signed_in?
      if current_user.profile==nil
          flash[:notice] = I18n.t('posts.edit.alertnew')
          redirect_to new_profile_path
          return
        end
      end
      #Gets redirected back to the review show page
    end

    #Checks to see if the current user is the creator of the review before the editing/updating/deleting/ actions
    def same_account
        @profile = find_profile
        if user_signed_in?
          if current_user.id == @profile.user_id
           flash[:notice] = I18n.t('posts.edit.alertno')
           redirect_to profile_path(@profile)
           return
         end
      end
      #Gets redirected back to the review show page
    end

    def find_profile
      @profile = Profile.find(params[:profile_id])
    end
end
