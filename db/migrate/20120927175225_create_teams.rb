class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string :gender
      t.string :sport
      t.string :level
      t.integer :school_id
      t.integer :league_id

      t.timestamps
    end
  end
end
