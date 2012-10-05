class AddGameStatsToGames < ActiveRecord::Migration
  def change
    add_column :games, :game_stats, :string
  end
end
