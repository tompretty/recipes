FactoryBot.define do
  factory :recipe do
    name { "MyString" }
    url { "MyString" }
    image_url { "MyString" }
    user { nil }
  end

  factory :user do
    email { "user@example.com" }
    password { "password" }
  end
end
