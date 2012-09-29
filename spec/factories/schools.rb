FactoryGirl.define do
  factory :school do
    sequence(:name) { |n| "school-#{n}" }
    sequence(:mascot) { |n| "mascot-#{n}" }
    sequence(:assn) { |n| "type-#{n}" }
  end
end
