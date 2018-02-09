class Occurrence < ApplicationRecord
  has_one :solution
  belongs_to :deadline
  belongs_to :problem
  belongs_to :severity
  belongs_to :inspection
  
  belongs_to :user
  mount_base64_uploader :picture, PictureUploader
  
  def has_solution?
    self.solution ? true : false
  end

end
