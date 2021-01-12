class User < ActiveRecord::Base
  has_secure_password

  before_validation :downcase_email
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false, message:'has already been taken' }
  validates :password, presence: true, confirmation: true
  validates :password_confirmation, presence: true

  def downcase_email
    self.email = email.downcase if email.present?
  end
end
