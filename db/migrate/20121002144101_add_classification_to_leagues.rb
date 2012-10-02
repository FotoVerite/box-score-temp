class AddClassificationToLeagues < ActiveRecord::Migration
  def change
    add_column :leagues, :classification, :string
  end
end
