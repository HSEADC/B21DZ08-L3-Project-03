class Profile < ApplicationRecord
    has_many :posts, dependent: :destroy
    belongs_to :user 
    validates :nick_name, uniqueness: true, on: :update
end
