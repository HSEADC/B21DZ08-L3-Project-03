class AddRequirementsToEmploymentOpportunities < ActiveRecord::Migration[7.0]
  def change
    add_column :employment_opportunities, :requirements, :text
  end
end
