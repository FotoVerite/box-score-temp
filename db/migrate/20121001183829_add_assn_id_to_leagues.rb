class AddAssnIdToLeagues < ActiveRecord::Migration
  def change
    add_column :leagues, :assn_id, :integer
  end
end
