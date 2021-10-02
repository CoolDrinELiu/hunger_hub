FactoryBot.define do
  factory :order do
    category { "bulk" }
    start_since { Date.today }
  end
end