class User < ApplicationRecord
  has_secure_password
  validates :name, presence: true
  validates :email, uniqueness: true
  has_many :occurrences
  mount_base64_uploader :picture, PictureUploader
end
