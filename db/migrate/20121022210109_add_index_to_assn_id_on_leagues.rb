class AddIndexToAssnIdOnLeagues < ActiveRecord::Migration[5.2]
  def change
    add_index :leagues, :assn_id
  end
end
