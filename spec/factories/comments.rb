FactoryBot.define do
  factory :comment do
    content { "Comment Content" }
    user { User.create(:user) }
    house { House.create(:house) }
  end
end
