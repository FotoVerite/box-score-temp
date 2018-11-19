class CreatePlayerStats < ActiveRecord::Migration[5.2]
  def change
    create_table :player_stats do |t|
      t.integer :team_id
      t.integer :game_id
      t.integer :player_id

      t.timestamps
    end
  end
end
