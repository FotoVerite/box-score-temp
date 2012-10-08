class RemoveSchoolIdFromGames < ActiveRecord::Migration
  def up
    remove_column :games, :school_id
  end

  def down
    add_column :games, :school_id, :integer
  end
end
