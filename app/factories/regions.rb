FactoryBot.define do
  factory :region do
    name { ApplicationRecord::REGIONS.sample }
  end
end
