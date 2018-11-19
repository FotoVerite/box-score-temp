class ChangeSportToSportIdOnSeasons < ActiveRecord::Migration[5.2]
  def change
    rename_column :seasons, :sport, :sport_id
  end
end
