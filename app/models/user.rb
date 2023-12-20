class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable, :registerable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :profile, dependent: :destroy
  has_many :posts
  after_create :create_user_profile
  def create_user_profile
    full_name = "#{name} #{surname}"
    create_profile(nick_name: full_name, profile_pic: upload_random_image)
  end
  def upload_random_image
    uploader = PostImageUploader.new(Post.new, :pic)
    uploader.cache!(File.open(Dir.glob(File.join(Rails.root, 'public/autoupload/profile', '*')).sample))
    uploader
  end  
end
