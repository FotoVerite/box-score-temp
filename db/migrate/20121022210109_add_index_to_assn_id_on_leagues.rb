class AddIndexToAssnIdOnLeagues < ActiveRecord::Migration
  def change
    add_index :leagues, :assn_id
  end
end
