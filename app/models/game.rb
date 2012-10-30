class Game < ActiveRecord::Base
  HOME = 'home'
  AWAY = 'away'

  attr_accessible :home_away, :team_id, :opponent_id, :site, :date, :game_stats,
                  :player_game_stats_attributes, :season_id, :publish

  delegate :sport, :sport_type, to: :team

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
  scope :published, where('published_at is not null')
  scope :unpublished, where('published_at is null')

  def self.with_team(team)
    where('team_id in (:teams) or opponent_id in (:teams)', teams: team)
  end

  def published?
    published_at?
  end

  def publish=(x)
    self.published_at = Time.now.utc
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
    team_score = stats.team_stats(team_id).final
    opponent_score = stats.team_stats(opponent_id).final

    if team_score > opponent_score
      team
    elsif opponent_score > team_score
      opponent
    else
      nil
    end
  end

  private

  def player_stats(team)
    player_game_stats.select do |stat|
      (team.players.include?(stat.player))
    end
  end
end
