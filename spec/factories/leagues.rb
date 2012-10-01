FactoryGirl.define do
  factory :league do
    sequence(:name) { |n| "League-#{n}" }
    assn
  end
end
