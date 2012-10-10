class PlayerGameStat < ActiveRecord::Base
  attr_accessible :game_id, :player_id, :team_id

  belongs_to :player
  belongs_to :game
end
