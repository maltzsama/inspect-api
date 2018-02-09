class Place < ApplicationRecord

  validates :name, presence: true
  validates :name, length: { in: 5..50, within: 'minimun 5 and maximum 50 allowed'}

  validates :description, length: { maximum: 200,too_long: '%{count} characters is the maximum allowed'}

  has_many :inspections
  belongs_to :costumer
end
