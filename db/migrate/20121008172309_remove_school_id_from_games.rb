class RemoveSchoolIdFromGames <  ActiveRecord::Migration[5.2]
  def up
    remove_column :games, :school_id
  end

  def down
    add_column :games, :school_id, :integer
  end
end
