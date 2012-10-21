class StatRecord < ActiveRecord::Base
  belongs_to :player_game_stat
  acts_as_list scope: :player_game_stat
end
