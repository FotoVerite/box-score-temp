class AddIndexesToTeams < ActiveRecord::Migration[5.2]
  def change
    add_index :teams, :school_id
    add_index :teams, :league_id
  end
end
