FactoryGirl.define do
  factory :season do
    start_date { '2011-09-01' }
    end_date { '2012-02-01' }
    sequence(:name) { |n| "name-#{n}" }
    sport { Sport::NAMES.sample }
    league
  end
end
