class User < ApplicationRecord
  acts_as_paranoid
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :token_authenticatable, :confirmable

  before_save :downcase_email

  # has_secure_password
  validates :name, presence: true
  validates :email, uniqueness: true, case_sensitive: false
  validates_format_of :email, with: /@/

  validates :name, length: { in: 6..50, within: 'minimun 6 and maximum 50 allowed'}
  validates :email, length: { in: 6..100, within: 'minimun 6 and maximum 100 allowed'}
  validates :bio, length: { maximum: 500, too_long: '%{count} characters is the maximum allowed' }
  validates :password, length: { in: 6..128, within: 'minimun 6 and maximum 128 allowed'}

  has_many :occurrences
  has_many :costumers
  has_many :authentication_tokens
  mount_base64_uploader :picture, PictureUploader

  private 
  def downcase_email
    self.email = self.email.delete(' ').downcase
  end

  def send_devise_notification(notification, *args)
    SendMailJob.perform_async(self, notification)
  end

end