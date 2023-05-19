FactoryBot.define do
  factory :blog do
    title { FFaker::Lorem.sentence }
    content { FFaker::Lorem.paragraph }
  end
end
