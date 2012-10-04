class RenameCompetitionIdOpponentId < ActiveRecord::Migration
  def up
    rename_column :games, :competition_id, :opponent_id
  end
end
