class AddStatsToPlayerGameStats < ActiveRecord::Migration[5.2]
  def change
    add_column :player_game_stats, :stats, :text
  end
end
