FactoryGirl.define do
  factory :season do
    start_date { '2012-09-01' }
    year { '2012-2013' }
    sport { 'Boys Basketball' }

    factory :baseball_season do
      sport { 'Boys Baseball' }
    end
  end
end
