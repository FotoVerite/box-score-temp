class RenameNameOnSeasons < ActiveRecord::Migration
  def change
    rename_column :seasons, :name, :year
  end
end
