class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :name
      t.string :description
      #t.string :picture

      t.references :theme

      t.timestamps
    end
    add_index :photos, :theme_id 
  end
end
