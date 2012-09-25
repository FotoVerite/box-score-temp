FactoryGirl.define do
  factory :admin do
    sequence(:email) { |n| "user-#{n}@example.com" }
    sequence(:first_name) { |n| "First#{n}" }
    sequence(:last_name) { |n| "Last#{n}" }
    sequence(:school_id) { |n| "#{n}" }
    password 'password'
  end
end
