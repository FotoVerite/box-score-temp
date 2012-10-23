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

  scope :latest, order('date DESC')
  scope :by_sport, lambda { |sport| joins(:team).where(teams: { sport: sport }) }
  scope :latest_by_sport, lambda { |sport| latest.by_sport(sport).limit(3) }

  #TODO refactor using scopes
  def self.latest_by_sport_assn(sport, assn)
    order(:date).select do |game|
      game.team.sport == sport &&
      (game.team.school.league.assn.name == assn || game.opponent.school.league.assn.name == assn)
    end.first(3)
  end

  def stats
    stats = GameStats.new(game_stats)
  end

  def player_stats_by_key(team, key)
    player_stats(team).select { |stat| stat.stats[key] }
  end

  def home_team
    if home_away == HOME
      team
    else
      opponent
    end
  end

  def away_team
    if home_away == AWAY
      team
    else
      opponent
    end
  end

  def winner
    if stats.team_stats(team_id).final > stats.team_stats(opponent_id).final
      team
    elsif stats.team_stats(team_id).final < stats.team_stats(opponent_id).final
      opponent
    else
      'tie'
    end
  end

  private

  def player_stats(team)
    player_game_stats.select do |stat|
      (team.players.include?(stat.player))
    end
  end
end
