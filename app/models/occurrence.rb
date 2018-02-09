class Occurrence < ApplicationRecord
  has_one :solution
  mount_base64_uploader :picture, PictureUploader
end
