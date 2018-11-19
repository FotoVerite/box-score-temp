class CreateTeamPlayersJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_table :team_players, id: false do |t|
      t.integer :team_id
      t.integer :player_id
    end
  end
end
