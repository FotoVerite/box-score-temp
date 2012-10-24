class Team < ActiveRecord::Base
  attr_accessible :season_id, :sport, :player_ids, :school_id

  delegate :name, to: :school, prefix: true

  validates_presence_of :sport, :season_id, :school_id

  belongs_to :school
  belongs_to :season

  has_many :games
  has_many :team_players

  has_many :players, through: :team_players

  scope :for_sport, lambda { |sport| where sport: sport }

  def self.ordered
    all.sort! { |x,y| x <=> y }
  end

  def display_name
    [school.name, sport].join(' ')
  end

  def potential_opponents
    Team.for_sport(sport).where("id != :me", me: id)
  end

  def sport_type
    if ['Boys Basketball', 'Girls Basketball'].include? sport
      'basketball'
    elsif ['Boys Baseball', 'Girls Softball'].include? sport
      'baseball'
    end
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
