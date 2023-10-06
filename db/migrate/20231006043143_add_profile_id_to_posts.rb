class AddProfileIdToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :profile_id, :integer
  end
end
