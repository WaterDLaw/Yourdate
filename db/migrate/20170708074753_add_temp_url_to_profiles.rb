class AddTempUrlToProfiles < ActiveRecord::Migration[5.1]
  def change
      add_column :profiles, :temp_url, :string
  end
end
