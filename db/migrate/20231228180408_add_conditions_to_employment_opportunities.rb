class AddConditionsToEmploymentOpportunities < ActiveRecord::Migration[7.0]
  def change
    add_column :employment_opportunities, :conditions, :text
  end
end
