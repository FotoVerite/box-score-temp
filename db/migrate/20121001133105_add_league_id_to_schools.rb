class AddLeagueIdToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :league_id, :integer
    add_index :schools, :league_id
  end
end
