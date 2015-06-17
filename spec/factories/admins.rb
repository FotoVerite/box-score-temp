FactoryGirl.define do
  factory :admin do
    school
    sequence(:email) { |n| "user-#{n}@example.com" }
    sequence(:first_name) { |n| "First#{n}" }
    sequence(:last_name) { |n| "Last#{n}" }
    password 'password'

    trait :superadmin do
      sequence(:email) { |n| "user-#{n}@wizarddevelopment.com" }
    end
  end
end
