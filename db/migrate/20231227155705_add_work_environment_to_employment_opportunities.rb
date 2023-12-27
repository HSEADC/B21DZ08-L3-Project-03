class AddWorkEnvironmentToEmploymentOpportunities < ActiveRecord::Migration[7.0]
  def change
    add_column :employment_opportunities, :work_environment, :string
  end
end
