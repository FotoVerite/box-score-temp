FactoryGirl.define do
  factory :school do
    sequence(:name) { |n| "school-#{n}" }
    sequence(:mascot) { |n| "mascot-#{n}" }
    sequence(:city) { |n| "city-#{n}" }
    sequence(:state) { |n| "state-#{n}" }
    sequence(:type) { |n| "type-#{n}" }
  end
end
