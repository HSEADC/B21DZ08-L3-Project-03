class AddContactLinkToEmploymentOpportunities < ActiveRecord::Migration[7.0]
  def change
    add_column :employment_opportunities, :contact_link, :string
  end
end
