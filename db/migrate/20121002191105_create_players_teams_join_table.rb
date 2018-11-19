class CreatePlayersTeamsJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_table :players_teams, id: false do |t|
      t.integer :player_id
      t.integer :team_id
    end
  end
end
