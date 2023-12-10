class AddReplyToPostIdToPost < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :reply_to_post_id, :integer
  end
end
