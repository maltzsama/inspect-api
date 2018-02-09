class Inspection < ApplicationRecord
  has_many :occurrences
  belongs_to :place
end
