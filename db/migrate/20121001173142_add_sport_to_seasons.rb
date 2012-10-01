class AddSportToSeasons < ActiveRecord::Migration
  def change
    add_column :seasons, :sport, :string
  end
end
