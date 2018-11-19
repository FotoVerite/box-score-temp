class RemoveSportFromGames <  ActiveRecord::Migration[5.2]
  def up
    remove_column :games, :sport
  end

  def down
    add_column :games, :sport, :string
  end
end
