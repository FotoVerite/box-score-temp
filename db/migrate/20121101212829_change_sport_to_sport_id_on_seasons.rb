class ChangeSportToSportIdOnSeasons < ActiveRecord::Migration
  def change
    rename_column :seasons, :sport, :sport_id
  end
end
