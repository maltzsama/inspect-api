class User < ApplicationRecord
  has_secure_password
  validates :name, presence: true
  validates :email, uniqueness: true
  mount_base64_uploader :picture, PictureUploader
end
