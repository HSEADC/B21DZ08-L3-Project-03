class AddSalaryToEmploymentOpportunities < ActiveRecord::Migration[7.0]
  def change
    add_column :employment_opportunities, :salary, :string
  end
end
