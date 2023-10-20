class RemoveProfileIdFromProfiles < ActiveRecord::Migration[7.0]
  def change
    remove_column :profiles, :profile_id, :integer
  end
end
