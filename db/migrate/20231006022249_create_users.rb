class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.integer :user_id
      t.string :password
      t.string :string
      t.string :user_status
      t.string :first_name
      t.string :second_name

      t.timestamps
    end
  end
end
