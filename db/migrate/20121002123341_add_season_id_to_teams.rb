class AddSeasonIdToTeams < ActiveRecord::Migration[5.2]
  def change
    add_column :teams, :season_id, :integer
  end
end
