class Team < ActiveRecord::Base
  extend ActiveHash::Associations::ActiveRecordExtensions
  attr_accessible :season_id, :sport_id, :player_ids, :school_id, :league_id

  delegate :name, to: :school, prefix: true
  delegate :sport_type, to: :sport

  validates_presence_of :sport, :season, :school, :league

  belongs_to_active_hash :sport
  belongs_to :school
  belongs_to :season
  belongs_to :league

  has_many :games
  has_many :team_players

  has_many :players, through: :team_players

  def display_name
    [school.name, sport.name].join(' ')
  end

  def potential_opponents
    Team.where(sport_id: self.sport_id).where("id != :me", me: id)
  end

  def player_game_stats(game)
    game.player_game_stats.select { |s| s.player.team_ids.include? self.id }
  end

  def as_json(options=nil)
    options ||= {}
    options = options.merge(methods: [:school_name, :display_name])
    super(options)
  end
end
