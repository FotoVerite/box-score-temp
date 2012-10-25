class RemoveLeagueIdFromSchools < ActiveRecord::Migration
  def up
    remove_column :schools, :league_id
  end

  def down
    add_column :schools, :league_id, :integer
    add_index :schools, :league_id
  end
end
