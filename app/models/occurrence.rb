class Occurrence < ApplicationRecord
  mount_base64_uploader :picture, PictureUploader
  # serialize :picture, JSON
end
