class RenamePlayerStats < ActiveRecord::Migration[5.2]
  def change
    rename_table :player_stats, :player_game_stats
  end
end
