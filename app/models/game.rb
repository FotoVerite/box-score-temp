class Game < ActiveRecord::Base
  HOME = 'home'
  AWAY = 'away'

  attr_accessible :home_away, :team_id, :opponent_id, :site, :date, :game_stats,
                  :player_game_stats_attributes, :season_id

  validates_presence_of :date
  validates_presence_of :team_id, :opponent_id
  validates_presence_of :site
  validates_presence_of :home_away

  validates_inclusion_of :home_away, in: [HOME, AWAY]

  belongs_to :team
  belongs_to :opponent, class_name: 'Team'
  belongs_to :season

  has_many :player_game_stats

  accepts_nested_attributes_for :player_game_stats,
      reject_if: proc { |s| s[:player_id].blank? },
      allow_destroy: true

  serialize :game_stats

  def stats
    stats = GameStats.new(game_stats)
  end
end