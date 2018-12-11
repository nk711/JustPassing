class ProfilesController < ApplicationController
  #Sets the profile
  before_action :set_profile, only: [:show, :edit, :update, :destroy]
  #Only users that have signed in can have access to these actions
  before_action :authenticate_user!, only: [:new, :edit, :destroy, :update, :create]
  #Prevents users from editing/destroying some one else's profile
  before_action :check, only: [:edit, :update, :destroy,]
  #The show action which used to show a user's profile. It shows a list of reviews and posts
  def show
    @reviews = Review.where(profile_id: params[:id])
    @reviews = @reviews.order(created_at: :desc)
    @posts = Post.where(:user_id => @profile.user_id).descending
    #If the reviews is blank..
    if @reviews.blank?
      #set average as 0
      @avg=0
    else
      #else if the reviews section is not blank
      @avg = @reviews.average(:rating).round(2)
    end
  end
  #The newaction is used allowing a user to create a profile
  def new
    @profile = current_user.build_profile
    @created = true
  end
  # The edit action is used allowing a user to edit a profile
  def edit
  end
  # The create action is used to allow a profile to be populated and saved to the database
  def create
    @profile = current_user.build_profile(profile_params)
    respond_to do |format|
      if @profile.save
        #Mails the user once they set up their profile
        #ContactMailer.register_email(current_user.email.to_s).deliver_now
        format.html { redirect_to @profile, notice: I18n.t('.success') }
        format.json { render :show, status: :created, location: @profile }
      else
        format.html { render :new }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end
  # The update action allows the user to add chantes to their profile
  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to @profile, notice: I18n.t('.success_update') }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end
  # The destroy action is used to destroy a user's profile
  def destroy
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to profiles_url, notice: I18n.t('.success_destroy') }
      format.json { head :no_content }
    end
  end
  #private methods used within this file
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
    end


    #Checks to see if the current user is the creator of the profile before the editing/updating/deleting/ actions
    def check
      if user_signed_in?
        unless current_user.id == @profile.user_id
          flash[:notice] = I18n.t('posts.edit.alertno')
          redirect_to root_path
         return
        end
      end
      #Gets redirected back to the root path
    end
    # Using strong parameter to only allow the following parameters
    def profile_params
        params.require(:profile).permit(
          :first_name,
          :last_name,
          :number,
          :city,
          :address_one,
          :address_two,
          :address_three,
          :postal_code)
    end

end
