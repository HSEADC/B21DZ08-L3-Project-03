class Post < ApplicationRecord
    has_many :replies, class_name: "Post", foreign_key: "reply_to_post_id", dependent: :destroy
    belongs_to :post, class_name: "Post", foreign_key: "reply_to_post_id", optional: true
    belongs_to :user
    default_scope{where(reply_to_post_id: nil)}
    mount_uploader :pic, PostImageUploader
    validates :post_title, presence: true
end
