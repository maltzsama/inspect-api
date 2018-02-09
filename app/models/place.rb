class Place < ApplicationRecord
  has_many :inspections
  belongs_to :costumer
end
