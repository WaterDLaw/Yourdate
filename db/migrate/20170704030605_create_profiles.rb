class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.references :user, foreign_key: true
      t.string :firstname
      t.string :lastname
      t.string :nickname
      t.integer :age
      t.string :profession
      t.text :about
      t.text :catchphrase
      t.text :introduction

      t.timestamps
    end
  end
end
