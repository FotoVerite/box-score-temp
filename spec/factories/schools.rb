FactoryGirl.define do
  factory :school do
    sequence(:name) { |n| "school-#{n}" }
    sequence(:mascot) { |n| "mascot-#{n}" }

    after(:build) do |school, evaluator|
      unless school.admin.present?
        school.admin = FactoryGirl.build(:admin, school: school)
      end
    end
  end
end
