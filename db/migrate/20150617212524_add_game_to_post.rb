class AddGameToPost < ActiveRecord::Migration
  def change
    add_column :posts, :game_id, :integer
    add_index :posts, :game_id
  end
end
