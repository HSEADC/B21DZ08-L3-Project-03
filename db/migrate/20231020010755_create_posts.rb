class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :post_title
      t.string :pic
      t.text :description
      t.string :link
      t.integer :profile_id

      t.timestamps
    end
  end
end
