class User < ApplicationRecord
  has_secure_password

  has_many :refresh_tokens, dependent: :destroy

  validates :user_name, presence: true
  validates :user_name, length: { minimum: 3, maximum: 20 }
  validates :user_name, uniqueness: { case_sensitive: false }

  validates :password, length: { minimum: 6, maximum: 128 }
end
