class RenameAwayTeamIdCompetitionIdOnGames < ActiveRecord::Migration
  def change
    rename_column :games, :away_team_id, :competition_id
  end
end
