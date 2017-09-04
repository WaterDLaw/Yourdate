class Profile < ApplicationRecord


  belongs_to :user


  def profile_picture
    Photograph.where(gallery_id: self.user.gallery.id).where(profile_picture: true)
  end

end
