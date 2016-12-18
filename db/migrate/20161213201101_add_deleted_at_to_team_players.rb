class AddDeletedAtToTeamPlayers < ActiveRecord::Migration[5.0]
  def change
    add_column :team_players, :deleted_at, :datetime
    add_index :team_players, :deleted_at
  end
end
