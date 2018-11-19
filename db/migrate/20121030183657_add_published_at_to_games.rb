class AddPublishedAtToGames < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :published_at, :timestamp
  end
end
