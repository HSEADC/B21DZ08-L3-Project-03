class Profile < ApplicationRecord
    has_many :posts
    mount_uploader :profile_pic, PostImageUploader
end
