class AddCompanyNameToEmploymentOpportunities < ActiveRecord::Migration[7.0]
  def change
    add_column :employment_opportunities, :company_name, :string
  end
end
