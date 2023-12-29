class AddWebLinksToProfiles < ActiveRecord::Migration[7.0]
  def change
    add_column :profiles, :web_link, :string
  end
end
