class AddAssnIdToLeagues < ActiveRecord::Migration[5.2]
  def change
    add_column :leagues, :assn_id, :integer
  end
end
