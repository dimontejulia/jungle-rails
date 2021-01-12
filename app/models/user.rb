class User < ActiveRecord::Base
  has_secure_password

  before_validation :downcase_email
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false, message:'email has already been taken' }
  validates :password, presence: true, confirmation: true, length: { minimum: 6, message:'password must be at least 6 characters' }
  validates :password_confirmation, presence: true

  def authenticate_with_credentials

  end

  def downcase_email
    self.email = email.downcase if email.present?
  end
end
