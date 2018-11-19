class AddClassificationToLeagues < ActiveRecord::Migration[5.2]
  def change
    add_column :leagues, :classification, :string
  end
end
