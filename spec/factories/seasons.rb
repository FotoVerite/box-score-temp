FactoryGirl.define do
  factory :season do
    start_date { '2012-09-01' }
    year { '2012-2013' }
    sport_id { 'boys-basketball' }

    factory :baseball_season do
      sport_id { 'boys-baseball' }
    end
  end
end
