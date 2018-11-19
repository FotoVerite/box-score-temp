class AddPositionToPlayerGameStats < ActiveRecord::Migration[5.2]
  def change
    add_column :player_game_stats, :position, :integer
  end
end
