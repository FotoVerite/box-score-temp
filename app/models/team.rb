class Team < ActiveRecord::Base
  extend ActiveHash::Associations::ActiveRecordExtensions
  attr_accessible :season_id, :sport_id, :player_ids, :school_id, :league_id, :coach_name,
    :coach_email, :coach_phone, :competitive_class

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

  has_many :players, through: :team_players, order: 'last_name, first_name'

  scope :ordered, joins(:school).order('schools.name')

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
    Team.where(sport_id: self.sport_id).where("teams.id != :me", me: id).includes(:school).ordered
  end

  def player_game_stats(game, player_stat_group)
    game.player_game_stats.select { |s| s.player.team_ids.include?(self.id) && s.player_stat_group == player_stat_group.id }
  end

  def as_json(options=nil)
    options ||= {}
    options = options.merge(methods: [:school_name, :display_name])
    super(options)
  end

  private

  def copy_sport_from_season
    if season.present?
      self.sport_id = season.sport_id
    end
  end
end
