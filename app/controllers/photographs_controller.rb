class PhotographsController < ApplicationController
  before_action :set_photograph, only: [:show, :edit, :update, :destroy]

  # GET /photographs
  # GET /photographs.json
  def index
    @photographs = Photograph.all
  end

  # GET /photographs/1
  # GET /photographs/1.json
  def show
  end

  # GET /photographs/new
  def new
    @photograph = Photograph.new
  end

  # GET /photographs/1/edit
  def edit
  end

  # POST /photographs
  # POST /photographs.json
  def create
    @photograph = Photograph.new(photograph_params)

    @photograph.temp_url = params["photograph"]["image"].tempfile.path
    @photograph.gallery_id = current_user.gallery.id
    @photograph.profile_picture = false

    respond_to do |format|
      if @photograph.save
        format.html { redirect_to mygallery_path, notice: 'Photograph was successfully created.' }
        format.json { render :show, status: :created, location: @photograph }
      else
        format.html { render :new }
        format.json { render json: @photograph.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /photographs/1
  # PATCH/PUT /photographs/1.json
  def update
    respond_to do |format|
      if @photograph.update(photograph_params)
        format.html { redirect_to @photograph, notice: 'Photograph was successfully updated.' }
        format.json { render :show, status: :ok, location: @photograph }
      else
        format.html { render :edit }
        format.json { render json: @photograph.errors, status: :unprocessable_entity }
      end
    end
  end

  def change_profile_pic

    puts "Got POST"

    @profile = Profile.where(user_id: current_user.id).first

    @current_profile_picture = Photograph.where(profile_picture: true).first
    @current_profile_picture.update_attribute('profile_picture', false)

    @new_profile_picture = Photograph.find(params[:photoId])
    @new_profile_picture.update_attribute('profile_picture', true)
  end

  def upload_profile_pic

    @profile = Profile.where(user_id: current_user.id).first

    puts "START UPLOaD"

    @photograph = Photograph.new(photograph_params)

    @photograph.temp_url = params["photograph"]["image"].tempfile.path
    @photograph.gallery_id = current_user.gallery.id
    @photograph.profile_picture = true

    #change the current profile_picture
    @current_profile_picture = Photograph.where(profile_picture: true).first
    unless @current_profile_picture.nil?
      puts @current_profile_picture.profile_picture
      @current_profile_picture.update_attribute('profile_picture', false)
    end

    if @photograph.save
      redirect_back(fallback_location: edit_profile_path(current_user.profile.id))

    else
      redirect_back(fallback_location: edit_profile_path(current_user.profile.id))
    end

  end

  # DELETE /photographs/1
  # DELETE /photographs/1.json
  def destroy
    @photograph.destroy
    redirect_back(fallback_location: mygallery_path)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photograph
      @photograph = Photograph.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def photograph_params
      params.require(:photograph).permit(:gallery_id, :image, :profile_picture)
    end
end
