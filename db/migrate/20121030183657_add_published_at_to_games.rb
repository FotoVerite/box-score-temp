class AddPublishedAtToGames < ActiveRecord::Migration
  def change
    add_column :games, :published_at, :timestamp
  end
end
