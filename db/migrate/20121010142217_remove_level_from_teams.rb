class RemoveLevelFromTeams <  ActiveRecord::Migration[5.2]
  def up
    remove_column :teams, :level
  end

  def down
    add_column :teams, :level, :string
  end
end
