class RemoveLeagueIdFromTeams < ActiveRecord::Migration
  def up
    remove_column :teams, :league_id
  end

  def down
    add_column :teams, :league_id, :integer
  end
end
