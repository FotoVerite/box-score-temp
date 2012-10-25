class AddLeagueIdToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :league_id, :integer
    add_index :teams, :league_id
  end
end
