class AddGameStatsToGames < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :game_stats, :string
  end
end
