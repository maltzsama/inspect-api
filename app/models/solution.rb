class Solution < ApplicationRecord

  validates :description, presence: true

  validates :description, length: { in: 15..500, within: 'minimun 15 and maximum 500 allowed'}

  validates :occurrence_id, uniqueness: { message: 'this occurrence is associated with a solution' }
  belongs_to :occurrence
  mount_base64_uploader :picture, PictureUploader
end
