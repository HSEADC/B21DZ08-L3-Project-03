class Profile < ApplicationRecord
    mount_uploader :profile_pic, PostImageUploader
    has_many :posts, dependent: :destroy
    belongs_to :user 
    validates :nick_name, uniqueness: true, on: :update
end
