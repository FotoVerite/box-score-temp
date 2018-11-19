class RenameAwayTeamIdCompetitionIdOnGames < ActiveRecord::Migration[5.2]
  def change
    rename_column :games, :away_team_id, :competition_id
  end
end
