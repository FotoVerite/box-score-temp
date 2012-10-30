FactoryGirl.define do
  factory :game do
    team
    opponent {|g| FactoryGirl.create(:team, league: g.team.league) }
    date { Date.today }
    home_away { 'home' }
    season
  end
end
