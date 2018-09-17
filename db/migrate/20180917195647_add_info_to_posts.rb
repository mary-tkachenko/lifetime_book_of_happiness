class AddInfoToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :location, :string
    add_column :posts, :string, :string
  end
end
