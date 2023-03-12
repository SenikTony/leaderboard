FactoryBot.define do
  factory :country do
    name { FFaker::Address.country }

    factory :country_with_users do
      transient { users_count { 10 } }

      after(:build) do |country, evaluator|
        build_list(:user, evaluator.users_count, country:)
      end

      after(:create) do |country, evaluator|
        create_list(:user, evaluator.users_count, country:)
        country.reload
      end
    end
  end
end
