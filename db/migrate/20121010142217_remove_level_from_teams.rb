class RemoveLevelFromTeams < ActiveRecord::Migration
  def up
    remove_column :teams, :level
  end

  def down
    add_column :teams, :level, :string
  end
end
