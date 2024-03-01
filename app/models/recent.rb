class Recent < ApplicationRecord
    belongs_to :recentable, polymorphic: true
    has_and_belongs_to_many :employment_opportunities
end
