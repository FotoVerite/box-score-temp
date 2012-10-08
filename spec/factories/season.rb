FactoryGirl.define do
  factory :season do
    start_date { '2012-09-01' }
    end_date { '2013-02-01' }
    sequence(:name) { |n| "name-#{n}" }
    sport { Sport::NAMES.sample }
    league
  end
end
