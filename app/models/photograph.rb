class Photograph < ApplicationRecord

  require "google/cloud/vision"

  belongs_to :gallery

  mount_uploader :image, PhotographUploader

  validate :test_val

  scope :find_profile_picture, -> (gallery_id) do
    where(gallery_id: gallery_id).where(profile_picture: true)
  end



  def test_val

    project_id = "datesite"
    image_path = self.temp_url

    vision = Google::Cloud::Vision.new project: project_id
    image  = vision.image image_path

    if image.face.nil? then
      puts "has no Face"
      errors.add(:image, "Please make sure that your Profile Picture has a face on it")
      false
    else
      puts "has a Face"
      true
    end

  end


end
