class Team < ActiveRecord::Base
  attr_accessible :level, :season_id, :player_ids, :sport

  delegate :name, to: :school, prefix: true

  validates_presence_of :sport, :season

  belongs_to :school
  belongs_to :season

  has_many :player_stats
  has_many :games

  has_and_belongs_to_many :players

  scope :for_sport, lambda { |sport| where sport: sport }

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
end
