class Post < ApplicationRecord
    belongs_to :profile
    mount_uploader :pic, PostImageUploader
end
