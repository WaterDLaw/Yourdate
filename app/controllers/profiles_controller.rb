class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy, :like, :unlike]
  before_action :set_my_profile, only: [:myprofile, :likes_me, :i_like, :mutual_likes]
  before_action :set_profile_picture, only: [:myprofile, :edit, :update, :destroy]
  before_action :find_conversation!, only: [:show]
  # before actions for likes
  before_action :find_likes_me, only: [:myprofile, :likes_me, :mutual_likes]
  before_action :find_who_i_like, only: [:myprofile, :i_like]
  before_action :find_mutual_likes, only: [:myprofile, :mutual_likes]

  # GET /profiles
  # GET /profiles.json
  def index
    @profiles = Profile.all.page params[:page]
  end

  # GET /profiles/1
  # GET /profiles/1.json
  def show
    #@profile_picture = Photograph.find_profile_picture(@profile.user.gallery.id).first
    @profile_picture = @profile.profile_picture.first
    @conversation = Conversation.between(current_user.id, @profile.user.id).first

    @personal_message = PersonalMessage.new
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

  def myprofile

    @conversations = Conversation.participating(current_user).order('updated_at ASC')


  end

  def i_like
    @user_who_likes = Kaminari.paginate_array(@user_who_likes).page(params[:page]).per(10)
  end

  def likes_me
    @user_likes = Kaminari.paginate_array(@user_likes).page(params[:page]).per(10)
  end

  def mutual_likes
    @user_mutual_likes = Kaminari.paginate_array(@user_mutual_likes).page(params[:page]).per(10)
  end

  def like
    puts "........................................................"
    puts "i like you"
    if @profile.liked_by current_user
      respond_to do |format|
        format.html {redirect_back(fallback_location: @profile)}
        format.js
      end
    end
  end

  def unlike
    puts "........................................................"
    puts "i dont like you anymore"
    if @profile.unliked_by current_user
      respond_to do |format|
        format.html {redirect_back(fallback_location: @profile)}
        format.js
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
    end

    def set_my_profile
      @profile = Profile.where(user_id: current_user.id).first
    end

    # Get the correct profile Picture
    def set_profile_picture
        @profile_picture = Photograph.find_profile_picture(current_user.gallery.id).first

    end

    def find_conversation!

        @receiver = Profile.where(id: params[:id]).first.user
        @conversation = Conversation.between(current_user.id, @profile.user.id).first

    end

    def find_likes_me
      # returns users array
      @user_likes = @profile.votes_for.voters
      puts "WHO LIKES ME"
      puts @user_likes
    end

    def find_who_i_like
      # returns profiles array
      @user_who_likes = current_user.find_up_voted_items
      puts "WHO I LIKE"
      puts @user_who_likes
    end

    def find_mutual_likes
      @user_mutual_likes = Array.new
      @user_likes.each do |user|
        if current_user.voted_for? user.profile
          puts "he likes too"
          @user_mutual_likes.push(user.profile)
        end
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.require(:profile).permit(:user_id, :firstname, :lastname, :nickname, :age, :profession, :about, :catchphrase, :introduction, :gender,:height,:weight, :hair_color, :eye_color, :relationship_status, :religion, :has_children, :wants_children, :smoking, :drinking, :wants_to_meet, :ethnic, :education, :looking_gender, looking_for: [])
    end
end
