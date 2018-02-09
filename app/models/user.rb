class User < ApplicationRecord
  has_secure_password
  validates :name, presence: true
  validates :email, uniqueness: true

  validates :name, length: { minimum: 5 , too_short: '%{count} characters is the minimun allowed' }
  validates :bio, length: { maximum: 500, too_long: '%{count} characters is the maximum allowed' }
  validates :password, length: { in: 6..20, within: 'minimun 6 and maximum 20 allowed'}

  has_many :occurrences
  has_many :costumers
  mount_base64_uploader :picture, PictureUploader

end
