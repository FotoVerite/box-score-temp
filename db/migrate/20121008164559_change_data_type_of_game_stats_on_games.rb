class ChangeDataTypeOfGameStatsOnGames < ActiveRecord::Migration
  def up
    change_column :games, :game_stats, :text
  end

  def down
    change_column :games, :game_stats, :string
  end
end
