class AddProfilePictureToPhotograph < ActiveRecord::Migration[5.1]
  def change
    add_column :photographs, :profile_picture, :boolean
  end
end
