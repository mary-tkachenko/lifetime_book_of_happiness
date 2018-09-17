class CreateClouds < ActiveRecord::Migration[5.2]
  def change
    create_table :clouds do |t|
      t.integer :post_id
      t.integer :tag_id
      t.integer :image_id

      t.timestamps
    end
  end
end
