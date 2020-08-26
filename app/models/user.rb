class User < ApplicationRecord
  before_save { self.email = email.downcase }
  has_many :articles

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :username, presence: true, uniqueness: { case_sensitive: false },
                       length: { minimum: 3, maximum: 25 }
  # validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :email, presence: true, uniqueness: { case_sensitive: false },
                    length: { maximum: 25 }, format: { with: VALID_EMAIL_REGEX }

  has_secure_password
end
