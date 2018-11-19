class AddNeutralSiteToGames < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :neutral_site, :boolean, default: false
  end
end
