class RefreshToken < ApplicationRecord
  belongs_to :user

  validates :token, presence: true
  validates :token, uniqueness: { case_sensitive: false }

  before_validation :generate_token

  private

  def generate_token
    token = SecureRandom.hex

    loop do
      RefreshToken.exists?(token: token) ? token = SecureRandom.hex : break
    end

    self.token = token
  end
end
