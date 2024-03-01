class CreateRecents < ActiveRecord::Migration[7.0]
  def change
    create_table :recents do |t|
      t.string :recentable_type
      t.integer :recentable_id

      t.timestamps
    end
  end
end
