class RenameNameOnSeasons < ActiveRecord::Migration[5.2]
  def change
    rename_column :seasons, :name, :year
  end
end
