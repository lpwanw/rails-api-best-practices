FactoryBot.define do
  factory :user do
    user_name { FFaker::Name.name.split(' ').join(%w[. _].sample).downcase.first(20) }
    password { "Aa@123456" }
    password_confirmation { "Aa@123456" }
  end
end
