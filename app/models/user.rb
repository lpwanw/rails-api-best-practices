class User < ApplicationRecord
  has_secure_password

  has_many :refresh_tokens, dependent: :destroy

  validates :user_name, presence: true
  validates :user_name, length: { minimum: 3, maximum: 20 }
  validates :user_name, uniqueness: { case_sensitive: false }

  validates :password, length: { minimum: 6, maximum: 128 }

  def auth_payload
    {
      sub: id,
      user_name: user_name,
      exp: Time.now.to_i + 4 * 3600
    }
  end

  def auth_token
    {
      access_token: Auth.issue(auth_payload),
      refresh_token: refresh_tokens.create!.token
    }
  end
end
