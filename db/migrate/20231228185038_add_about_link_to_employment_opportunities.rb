class AddAboutLinkToEmploymentOpportunities < ActiveRecord::Migration[7.0]
  def change
    add_column :employment_opportunities, :about_link, :string
  end
end
