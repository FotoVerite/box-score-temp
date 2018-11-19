class RemoveTeamIdFromPlayerGameStats <  ActiveRecord::Migration[5.2]
  def up
    remove_column :player_game_stats, :team_id
  end

  def down
    add_column :player_game_stats, :team_id, :integer
  end
end
