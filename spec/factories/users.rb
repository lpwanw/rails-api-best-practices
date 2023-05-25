FactoryBot.define do
  factory :user do
    user_name { FFaker::Internet.user_name }
    password { "Aa@123456" }
    password_confirmation { "Aa@123456" }
  end
end
