# == Schema Information
#
# Table name: games
#
#  id           :integer          not null, primary key
#  date         :date
#  opponent_id  :integer
#  home_away    :string(255)
#  team_id      :integer
#  season_id    :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  game_stats   :text
#  published_at :datetime
#  neutral_site :boolean          default(FALSE)
#  admin_id     :integer
#

FactoryGirl.define do
  factory :game do
    team
    opponent { |g| FactoryGirl.create(:team, league: g.team.league) }
    date { Date.today }
    home_away { 'home' }
    season

    trait :published do
      published_at Time.now
    end
  end
end
