class Occurrence < ApplicationRecord
  has_one :solution
  belongs_to :deadline, class_name: 'Deadline', optional: true
  belongs_to :problem, class_name: 'Problem', optional: true
  belongs_to :severity, class_name: 'severity', optional: true
  belongs_to :inspection
  belongs_to :user

  mount_base64_uploader :picture, PictureUploader
  
  def has_solution?
    self.solution ? true : false
  end

end
