class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]
  before_action :set_profile_picture, only: [:myprofile, :edit, :update, :destroy]
  # GET /profiles
  # GET /profiles.json
  def index
    @profiles = Profile.all
  end

  # GET /profiles/1
  # GET /profiles/1.json
  def show
    puts @profile.user.gallery.id
    @profile_picture = Photograph.find_profile_picture(@profile.user.gallery.id).first

  end

  def myprofile
    @profile = Profile.where(user_id: current_user.id).first

    puts @profile_picture
  end
  # GET /profiles/new
  def new
    @profile = Profile.new
  end

  # GET /profiles/1/edit
  def edit

  end

  # POST /profiles
  # POST /profiles.json
  def create

    @profile = Profile.new(profile_params)
    respond_to do |format|
      if @profile.save
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
        puts profile_params
        format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
end

  def update_profile_image
    @profile = Profile.where(user_id: current_user.id).first

    @profile.temp_url = params["profile"]["image"].tempfile.path

    respond_to do |format|
      if @profile.update(profile_params)
        puts profile_params
        format.html { redirect_to @profile, notice: 'Profile Picture was successfully updated.' }
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

    # Get the correct profile Picture
    def set_profile_picture
        @profile_picture = Photograph.find_profile_picture(current_user.gallery.id).first

    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.require(:profile).permit(:user_id, :firstname, :lastname, :nickname, :age, :profession, :about, :catchphrase, :introduction, :gender,:height,:weight, :hair_color, :eye_color, :relationship_status, :religion, :has_children, :wants_children, :smoking, :drinking, :wants_to_meet, :ethnic, :education, :looking_gender, looking_for: [])
    end
end
