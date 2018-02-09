class Occurrence < ApplicationRecord
  has_one :solution
  belongs_to :deadline, class_name: 'Deadline', optional: true
  belongs_to :problem, class_name: 'Problem', optional: true
  belongs_to :severity, class_name: 'severity', optional: true
  belongs_to :inspection
  belongs_to :user

  validates :description, presence: true
  validates :description, length: { in: 15..500, within: 'minimun 15 and maximum 500 allowed'}


  mount_base64_uploader :picture, PictureUploader
  
  def solution?
    solution ? true : false
  end
end