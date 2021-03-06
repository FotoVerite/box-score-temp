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

class Game < ActiveRecord::Base
  HOME_AWAY = [
    HOME = 'home'.freeze,
    AWAY = 'away'.freeze
  ].freeze

  delegate :sport, :sport_type, to: :team

  validates_presence_of :date
  validates_presence_of :team_id, :opponent_id
  validates_presence_of :home_away

  validates_inclusion_of :home_away, in: HOME_AWAY

  belongs_to :team
  belongs_to :opponent, class_name: 'Team'
  belongs_to :season

  has_many :player_game_stats, dependent: :destroy
  has_many :posts

  accepts_nested_attributes_for :player_game_stats,
                                reject_if: proc { |s| s[:player_id].blank? },
                                allow_destroy: true

  serialize :game_stats

  scope :latest, -> { order('date DESC') }
  scope :published, -> { where('published_at is not null') }
  scope :unpublished, -> { where('published_at is null') }

  def self.with_team(teams)
    where('team_id in (?) or opponent_id in (?)', teams, teams)
  end

  def published?
    published_at?
  end

  def publish=(_x)
    @publishing = true if published_at.nil?

    self.published_at = Time.now.utc
  end

  def publishing?
    defined?(@publishing) && @publishing == true
  end

  def stats
    @_stats ||= GameStats.new(game_stats)
  end

  def summary_stats
    sport.summary_stats.select { |stat, _attrs| stats.team_stats(winner).send(stat).present? }
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
end
