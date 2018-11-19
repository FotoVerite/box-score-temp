class RemoveEndDateLeagueIdFromSeason <  ActiveRecord::Migration[5.2]
  def up
    remove_column :seasons, :end_date
    remove_column :seasons, :league_id
  end

  def down
    add_column :seasons, :end_date, :date
    add_column :seasons, :league_id, :integer
  end
end
