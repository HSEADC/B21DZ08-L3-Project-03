class CreateEmploymentOpportunities < ActiveRecord::Migration[7.0]
  def change
    create_table :employment_opportunities do |t|
      t.string :title
      t.text :description
      t.string :vacancy_type
      t.references :user, null: false, foreign_key: true
      t.string :status
      t.date :application_deadline
      t.string :location

      t.timestamps
    end
  end
end
