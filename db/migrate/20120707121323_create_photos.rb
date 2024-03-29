class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :name
      t.text :description
      t.integer :user_id

      t.references :theme
      t.references :user

      t.timestamps
    end
    add_index :photos, :theme_id 
    add_index :photos, :user_id
  end
end
