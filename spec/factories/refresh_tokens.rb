FactoryBot.define do
  factory :refresh_token do
    user
    token { SecureRandom.hex(64) }
  end
end
