class Team < ActiveRecord::Base
  attr_accessible :level, :season_id, :player_ids, :sport

  validates_presence_of :sport, :season

  belongs_to :school
  belongs_to :season

  has_many :player_stats

  has_and_belongs_to_many :players

  def team_with_school_name
    "#{school.name} #{sport}"
  end
end
