class ChangeDataTypeOfGameStatsOnGames <  ActiveRecord::Migration[5.2]
  def up
    change_column :games, :game_stats, :text
  end

  def down
    change_column :games, :game_stats, :string
  end
end
