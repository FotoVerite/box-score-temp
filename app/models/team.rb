# == Schema Information
#
# Table name: teams
#
#  id                :integer          not null, primary key
#  school_id         :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  season_id         :integer
#  league_id         :integer
#  sport_id          :string(255)
#  coach_name        :string(255)
#  coach_email       :string(255)
#  coach_phone       :string(255)
#  competitive_class :string(255)
#

class Team < ActiveRecord::Base
  extend ActiveHash::Associations::ActiveRecordExtensions


  delegate :name, to: :school, prefix: true
  delegate :sport_type, :gender, to: :sport

  before_validation :copy_sport_from_season

  validates_presence_of :sport, :season, :school, :league

  belongs_to_active_hash :sport
  belongs_to :school
  belongs_to :season
  belongs_to :league

  has_many :games, dependent: :destroy
  has_many :team_players

  has_many :players, -> { order 'players.last_name, players.first_name' }, through: :team_players

  scope :ordered, -> { joins(:school).order('schools.name') }

  def display_name
    [school.try(:name) || '??? Missing School ???', sport.name].join(' ')
  end

  def display_name_no_gender
    display_name.sub('Boys', '').sub('Girls', '')
  end

  def boys?
    gender == 'boys'
  end

  def girls?
    gender == 'girls'
  end

  def potential_opponents
    Team.where(sport_id: sport_id).where('teams.id != :me', me: id).includes(:school).ordered
  end

  def player_game_stats(game, player_stat_group)
    game.player_game_stats.select { |s| s.player.team_ids.include?(id) && s.player_stat_group == player_stat_group.id }
  end

  def as_json(options = nil)
    options ||= {}
    options = options.merge(methods: [:school_name, :display_name])
    super(options)
  end

  private

  def copy_sport_from_season
    self.sport_id = season.sport_id if season.present?
  end
end
