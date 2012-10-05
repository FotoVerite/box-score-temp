class Game < ActiveRecord::Base
  attr_accessible :home_away

  validates_presence_of :date
  validates_presence_of :sport
  validates_presence_of :opponent_id
  validates_presence_of :site
  validates_presence_of :home_away
  validates_presence_of :game_stats

  belongs_to :team
  belongs_to :school
  belongs_to :season

  serialize :game_stats
end
