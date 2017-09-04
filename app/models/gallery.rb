class Gallery < ApplicationRecord
  belongs_to :user

  has_many :photographs, inverse_of: :gallery

  accepts_nested_attributes_for :photographs, allow_destroy: true

end
