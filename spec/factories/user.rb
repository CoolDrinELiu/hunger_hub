FactoryBot.define do
  factory :user do
    role {1}
    name { Faker::Name.name }
    password_digest {'password'}
  end
end