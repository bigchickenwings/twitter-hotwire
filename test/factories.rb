FactoryBot.define do
  factory :user do
    email { "john@gmail.com" }
    password { "secure_password" }
  end

  factory :tweet do
    body { "initial tweet" }
    user
  end
end