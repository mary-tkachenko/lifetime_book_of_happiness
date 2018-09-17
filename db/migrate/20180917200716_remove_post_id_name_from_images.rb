class RemovePostIdNameFromImages < ActiveRecord::Migration[5.2]
  def change
    remove_column :images, :post_id, :integer
  end
end
