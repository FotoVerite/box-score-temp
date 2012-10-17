FactoryGirl.define do
  factory :game do
    team
    opponent { team }
    date { Date.today }
    site { 'home' }
    home_away { 'home' }
    season
  end
end
