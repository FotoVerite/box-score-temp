class AddLeagueIdToSchools < ActiveRecord::Migration[5.2]
  def change
    add_column :schools, :league_id, :integer
    add_index :schools, :league_id
  end
end
