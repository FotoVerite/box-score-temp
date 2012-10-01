class CreateSeasons < ActiveRecord::Migration
  def change
    create_table :seasons do |t|
      t.string :name
      t.integer :league_id
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
