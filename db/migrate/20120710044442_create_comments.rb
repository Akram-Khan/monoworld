class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :comment
      t.integer :user_id
      
      t.references :user
      t.references :photo

      t.timestamps
    end
    add_index :comments, :photo_id
    add_index :comments, :user_id
  end
end
