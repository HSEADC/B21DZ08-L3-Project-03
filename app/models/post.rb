class Post < ApplicationRecord
    belongs_to :profile
    belongs_to :user
    mount_uploader :pic, PostImageUploader
end
