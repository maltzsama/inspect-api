class Solution < ApplicationRecord
  validates :occurrence_id, uniqueness: { message: "this occurrence has a solution" }
  belongs_to :occurrence
  mount_base64_uploader :picture, PictureUploader
end
