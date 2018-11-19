class RemoveSiteFromGames <  ActiveRecord::Migration[5.2]
  def up
    remove_column :games, :site
  end

  def down
    add_column :games, :site, :string
  end
end
