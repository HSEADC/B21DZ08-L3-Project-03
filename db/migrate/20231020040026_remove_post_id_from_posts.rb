class RemovePostIdFromPosts < ActiveRecord::Migration[7.0]
  def change
    remove_column :posts, :post_id, :integer
  end
end
