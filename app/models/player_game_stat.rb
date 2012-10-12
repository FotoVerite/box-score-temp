class PlayerGameStat < ActiveRecord::Base
  attr_accessible :stats

  belongs_to :player
  belongs_to :game

  serialize :stats
end
