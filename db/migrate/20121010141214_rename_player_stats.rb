class RenamePlayerStats < ActiveRecord::Migration
  def change
    rename_table :player_stats, :player_game_stats
  end
end
