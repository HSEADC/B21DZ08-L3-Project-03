class AddCompanyDescriptionToEmploymentOpportunities < ActiveRecord::Migration[7.0]
  def change
    add_column :employment_opportunities, :company_description, :text
  end
end
