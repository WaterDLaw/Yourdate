class Photograph < ApplicationRecord
  belongs_to :gallery

  mount_uploader :image, PhotographUploader

end
