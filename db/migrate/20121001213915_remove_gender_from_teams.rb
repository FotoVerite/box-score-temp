class RemoveGenderFromTeams < ActiveRecord::Migration
  def up
    remove_column :teams, :gender
  end

  def down
    add_column :teams, :gender, :string
  end
end
