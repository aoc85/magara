FactoryBot.define do
  factory :comment do
    content { "MyText" }
    user { nil }
    house { nil }
  end
end
