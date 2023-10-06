class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.integer :post_id
      t.string :post_name
      t.string :pic
      t.text :description
      t.string :link

      t.timestamps
    end
  end
end
