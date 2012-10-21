class AddPositionToPlayerGameStats < ActiveRecord::Migration
  def change
    add_column :player_game_stats, :position, :integer
  end
end
