class Profile < ApplicationRecord

  belongs_to :user

  #this model can be voted/liked
  acts_as_votable

  def profile_picture
    Photograph.where(gallery_id: self.user.gallery.id).where(profile_picture: true)
  end




end
