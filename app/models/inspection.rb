class Inspection < ApplicationRecord
  validates :name, presence: true
  validates :name, length: { in: 6..50, within: 'minimun 6 and maximum 50 allowed'}
  
  validates :description, length: { maximum: 200, too_long: '%{count} characters is the maximum allowed' }

  has_many :occurrences
  belongs_to :place

end