class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.string :profile_pic
      t.string :nick_name
      t.text :description
      t.string :location

      t.timestamps
    end
  end
end
