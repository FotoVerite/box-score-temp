class DropTeamPlayers < ActiveRecord::Migration
  def up
    drop_table :team_players
  end

  def down
    create_table :team_players, id: false do |t|
      t.integer :team_id
      t.integer :player_id
    end
  end
end
