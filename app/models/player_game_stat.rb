class PlayerGameStat < ActiveRecord::Base
  attr_accessible :game_id, :player_id, :stats

  belongs_to :player
  belongs_to :game

  serialize :stats
end
