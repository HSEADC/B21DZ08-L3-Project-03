class CreateJoinTableEmploymentOpportunityRecent < ActiveRecord::Migration[7.0]
  def change
    create_join_table :employment_opportunities, :recents do |t|
      t.index :employment_opportunity_id, name: 'index_eo_recents_on_eo_id'
      t.index :recent_id, name: 'index_eo_recents_on_recent_id'
      t.timestamps
    end
  end
end
