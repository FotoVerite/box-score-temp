class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.date :date
      t.string :sport
      t.integer :away_team_id
      t.string :site
      t.string :home_away
      t.integer :school_id
      t.integer :team_id
      t.integer :season_id
      t.timestamps
    end
  end
end
