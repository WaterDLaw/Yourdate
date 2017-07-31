class Profile < ApplicationRecord

  require "google/cloud/vision"

  belongs_to :user

  mount_uploader :image, ImageUploader

  attr_accessor :skip_test_val

  validate :test_val, unless: :skip_test_val


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
