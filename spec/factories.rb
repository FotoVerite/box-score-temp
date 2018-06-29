FactoryBot.define do
  sequence :email do |n|
    "user-#{n}@example.com"
  end
  sequence(:first_name) { |n| "First#{n}" }
  sequence(:last_name) { |n| "Last#{n}" }
end
