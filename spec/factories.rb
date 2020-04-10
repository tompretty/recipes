FactoryBot.define do
  factory :recipe do
    name { "My Recipe" }
    url { "http://example.com" }
    image_url { "http://example.com/image.jpg" }
    user
  end

  factory :user do
    email { "user@example.com" }
    password { "password" }
  end
end
