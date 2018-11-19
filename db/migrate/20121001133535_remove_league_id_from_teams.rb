class RemoveLeagueIdFromTeams <  ActiveRecord::Migration[5.2]
  def up
    remove_column :teams, :league_id
  end

  def down
    add_column :teams, :league_id, :integer
  end
end
