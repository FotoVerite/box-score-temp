class AddSportToSeasons < ActiveRecord::Migration[5.2]
  def change
    add_column :seasons, :sport, :string
  end
end
