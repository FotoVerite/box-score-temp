class Game < ActiveRecord::Base
  HOME_AWAY = [
    HOME = 'home',
    AWAY = 'away'
  ]

  attr_accessible :home_away, :team_id, :opponent_id, :date, :game_stats,
    :player_game_stats_attributes, :season_id, :publish, :published_at,
    :neutral_site

  delegate :sport, :sport_type, to: :team

  before_validation :set_date
  before_validation :validate_date_format

  validates_presence_of :date
  validates_presence_of :team_id, :opponent_id
  validates_presence_of :home_away

  validates_inclusion_of :home_away, in: HOME_AWAY

  belongs_to :team
  belongs_to :opponent, class_name: 'Team'
  belongs_to :season

  has_many :player_game_stats, dependent: :destroy

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
    @publishing = true if self.published_at.nil?

    self.published_at = Time.now.utc
  end

  def publishing?
    defined?(@publishing) && @publishing == true
  end

  def stats
    @_stats ||= GameStats.new(game_stats)
  end

  def summary_stats
    sport.summary_stats.select { |stat, attrs| stats.team_stats(winner).send(stat).present? }
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

  def to_param
    description = "#{team.display_name}-vs-#{opponent.display_name}".parameterize
    "#{id}-#{description}"
  end

  def title
    "#{sport.name} - #{away_team.school_name} #{preposition} #{home_team.school_name}"
  end

  def preposition
    if neutral_site?
      'vs'
    else
      'at'
    end
  end

  private

  def player_stats(team)
    player_game_stats.select do |stat|
      team.players.include?(stat.player)
    end
  end

  def set_date
    self.date ||= current_date
  end

  def current_date
    # if it's morning in my time zone, default to yesterday's date
    if Time.current.hour < 12
      Date.yesterday
    else
      Date.current
    end
  end

  def validate_date_format
    date.is_a?(Date)
  end
end
