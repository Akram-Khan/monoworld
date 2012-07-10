class CreateThemes < ActiveRecord::Migration
  def change
    create_table :themes do |t|
      t.string :name
      t.text :description
      t.integer :user_id

      t.references :user

      t.timestamps
    end
    add_index :themes, :user_id
  end
end
