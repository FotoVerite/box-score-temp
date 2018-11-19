class ChangeTeamSportToSportId <  ActiveRecord::Migration[5.2]
  def up
    add_column :teams, :sport_id, :string
    add_index :teams, :sport_id

    Sport.all.each do |sport|
      ActiveRecord::Base.connection.execute "UPDATE teams SET sport_id='#{sport.id}' where sport='#{sport.name}'"
    end

    remove_column :teams, :sport
  end

  def down
    add_column :teams, :sport, :string

    Sport.all.each do |sport|
      ActiveRecord::Base.connection.execute "UPDATE teams SET sport='#{sport.name}' where sport_id='#{sport.id}'"
    end

    remove_column :teams, :sport_id
  end
end
