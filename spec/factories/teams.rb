FactoryGirl.define do
  factory :team do
    season
    sport { season.sport }
    school
  end
end
