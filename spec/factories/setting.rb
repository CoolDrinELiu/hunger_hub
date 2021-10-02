FactoryBot.define do
  factory :setting do
    cut_off_at {20.days.ago}
  end
end