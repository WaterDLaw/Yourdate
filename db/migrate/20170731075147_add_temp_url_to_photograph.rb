class AddTempUrlToPhotograph < ActiveRecord::Migration[5.1]
  def change
    add_column :photographs, :temp_url, :string
  end
end
