FactoryBot.define do
  factory :user do
    user_name { FFaker::Internet.user_name }
    password_digest { "Aa@123456" }
  end
end
