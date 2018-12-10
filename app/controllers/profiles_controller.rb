class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit]


  # GET /profiles/1
  # GET /profiles/1.json
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

  # building a profile for the current user
  def new
    @profile = current_user.build_profile
    @created = true
  end

  # GET /profiles/1/edit
  def edit
  end

  # POST /profiles
  # POST /profiles.json
  def create
    @profile = current_user.build_profile(profile_params)

    respond_to do |format|
      if @profile.save
        ContactMailer.register_email(current_user).deliver_now
        format.html { redirect_to @profile, notice: 'Profile was successfully created.' }
        format.json { render :show, status: :created, location: @profile }
      else
        format.html { render :new }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profiles/1
  # PATCH/PUT /profiles/1.json
  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to profiles_url, notice: 'Profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
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
