FactoryGirl.define do
  factory :assn do
    sequence(:name) { |n| "Association-#{n}" }
  end
end
