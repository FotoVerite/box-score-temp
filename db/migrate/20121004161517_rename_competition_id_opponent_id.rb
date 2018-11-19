class RenameCompetitionIdOpponentId <  ActiveRecord::Migration[5.2]
  def up
    rename_column :games, :competition_id, :opponent_id
  end
end
