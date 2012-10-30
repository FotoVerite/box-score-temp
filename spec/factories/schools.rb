FactoryGirl.define do
  factory :school do
    sequence(:name) { |n| "school-#{n}" }
    sequence(:mascot) { |n| "mascot-#{n}" }

    after(:build) do |school, evaluator|
      unless school.admins.any?
        school.admins << FactoryGirl.build(:admin, school: school)
      end
    end
  end
end
