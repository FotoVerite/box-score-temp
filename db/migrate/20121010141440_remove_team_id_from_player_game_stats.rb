class RemoveTeamIdFromPlayerGameStats < ActiveRecord::Migration
  def up
    remove_column :player_game_stats, :team_id
  end

  def down
    add_column :player_game_stats, :team_id, :integer
  end
end
