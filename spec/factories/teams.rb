FactoryGirl.define do
  factory :team do
    sequence(:level) { ['Varsity'].sample }
    sequence(:sport) { |n| "sport-#{n}" }
    school
  end
end

