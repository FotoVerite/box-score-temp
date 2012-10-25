class ChangeTeamSportToSportId < ActiveRecord::Migration
  def up
    add_column :teams, :sport_id, :string
    add_index :teams, :sport_id

    Sport.all.each do |sport|
      execute "update teams set sport_id='#{sport.id}' where sport='#{sport.name}'"
    end

    remove_column :teams, :sport
  end

  def down
    add_column :teams, :sport, :string

    Sport.all.each do |sport|
      execute "update teams set sport='#{sport.name}' where sport_id='#{sport.id}'"
    end

    remove_column :teams, :sport_id
  end
end
