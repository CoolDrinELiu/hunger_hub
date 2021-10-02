include ActionDispatch::TestProcess
FactoryBot.define do
  factory :food do
    name { Faker::Food.dish }
    logo { fixture_file_upload(Rails.root.join('spec', 'fixtures', 'abc.png'), 'image/png') }
    desc {"Desc"}
  end
end