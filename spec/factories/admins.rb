FactoryGirl.define do
  factory :admin do
    school
    sequence(:email) { |n| "user-#{n}@example.com" }
    sequence(:first_name) { |n| "First#{n}" }
    sequence(:last_name) { |n| "Last#{n}" }
    password 'password'
  end
end
