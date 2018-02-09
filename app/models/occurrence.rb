class Occurrence < ApplicationRecord
  has_one :solution
  belongs_to :deadline
  belongs_to :problem
  belongs_to :severity
  mount_base64_uploader :picture, PictureUploader
  
  def has_solution?
    self.solution ? true : false
  end

end
