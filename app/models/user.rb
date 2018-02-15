class User < ApplicationRecord
  before_save :downcase_email

  has_secure_password
  validates :name, presence: true
  validates :email, uniqueness: true, case_sensitive: false
  validates_format_of :email, with: /@/

  validates :name, length: { in: 6..50, within: 'minimun 6 and maximum 50 allowed'}
  validates :email, length: { in: 6..100, within: 'minimun 6 and maximum 100 allowed'}
  validates :bio, length: { maximum: 500, too_long: '%{count} characters is the maximum allowed' }
  validates :password, length: { in: 6..20, within: 'minimun 6 and maximum 20 allowed'}

  has_many :occurrences
  has_many :costumers
  mount_base64_uploader :picture, PictureUploader
  
  def generate_password_token!
    self.password = generate_passwd
    save!
  end

  private 
  def downcase_email
    self.email = self.email.delete(' ').downcase
  end
  
  def generate_passwd
    SecureRandom.base64(12)
  end

end