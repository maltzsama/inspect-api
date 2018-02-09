class Costumer < ApplicationRecord

  validates :name, presence: true
  validates :cnpj, presence: true
  validates :cnpj, uniqueness: true
  validates :cnpj, length: { is: 14, message: 'need to be %{count}' }
  validates :name, length: { in: 5..50, within: 'minimun 5 and maximum 50 allowed'}
  validates :address, length: { in: 6..200, within: 'minimun 6 and maximum 200 allowed'}
  validates :contact, length: { maximum: 50,too_long: '%{count} characters is the maximum allowed'}
  validates :fone, length: { maximum: 15 , too_long: '%{count} characters is the maximum allowed' }
  
  has_many :places
  belongs_to :user
end