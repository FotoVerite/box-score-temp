class AddStatsToPlayerGameStats < ActiveRecord::Migration
  def change
    add_column :player_game_stats, :stats, :text
  end
end
