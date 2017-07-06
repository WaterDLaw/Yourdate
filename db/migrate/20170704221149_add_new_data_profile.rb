class AddNewDataProfile < ActiveRecord::Migration[5.1]
  def change
    add_column :profiles, :education, :string
    add_column :profiles, :ethnic, :string
    add_column :profiles, :looking_gender, :string
    add_column :profiles, :looking_for, :text, array: true, default: []
  end
end
