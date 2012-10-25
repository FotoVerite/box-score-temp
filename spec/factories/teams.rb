FactoryGirl.define do
  factory :team do
    league
    school
    season
    sport { season.sport }
  end
end
