FactoryBot.define do
  factory :user do
    association :country, strategy: :build
    sequence :name do |n|
      "#{FFaker::Internet.user_name}_#{n}"
    end
    points { Random.rand(150..1_000_000) }
  end
end
