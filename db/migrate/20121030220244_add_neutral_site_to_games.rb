class AddNeutralSiteToGames < ActiveRecord::Migration
  def change
    add_column :games, :neutral_site, :boolean, default: false
  end
end
