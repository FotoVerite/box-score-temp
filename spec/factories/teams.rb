FactoryGirl.define do
  factory :team do
    level { 'Varsity' }
    season { create :season }
    sport { season.sport }
    school
  end
end
