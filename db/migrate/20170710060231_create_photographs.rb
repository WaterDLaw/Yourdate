class CreatePhotographs < ActiveRecord::Migration[5.1]
  def change
    create_table :photographs do |t|
      t.belongs_to :gallery, foreign_key: true
      t.string :image
    
      t.timestamps
    end
  end
end
