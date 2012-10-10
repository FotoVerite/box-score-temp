class DropPlayersTeams < ActiveRecord::Migration
  def up
    drop_table :players_teams
  end

  def down
    create_table :players_teams, id: false do |t|
      t.integer :player_id
      t.integer :team_id
    end
  end
end
