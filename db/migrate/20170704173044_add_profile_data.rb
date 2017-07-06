class AddProfileData < ActiveRecord::Migration[5.1]
  def change
    add_column :profiles, :gender, :string
    add_column :profiles, :height, :string
    add_column :profiles, :weight, :string
    add_column :profiles, :hair_color, :string
    add_column :profiles, :eye_color, :string
    add_column :profiles, :relationship_status, :string
    add_column :profiles, :religion, :string
    add_column :profiles, :has_children, :string
    add_column :profiles, :wants_children, :string
    add_column :profiles, :smoking, :string
    add_column :profiles, :drinking, :string
    add_column :profiles, :wants_to_meet, :text
  end
end
