class User < ApplicationRecord
  before_save {self.email = email.downcase}
  validates :name, presence: true, length: {minimum: 3, maximum: 55}

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i 
  validates :email, presence: true, uniqueness: { case_sensitive: false },
            format: { with: VALID_EMAIL_REGEX }


  validates :password, presence: true, length: { minimum: 6 }

  has_many :messages, dependent: :destroy

  has_secure_password


end
