class RemoveSportFromGames < ActiveRecord::Migration
  def up
    remove_column :games, :sport
  end

  def down
    add_column :games, :sport, :string
  end
end
