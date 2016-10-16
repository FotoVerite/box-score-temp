class AddAdminIdToGameAndPost < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :admin_id, :integer
    add_column :posts, :admin_id, :integer
  end
end
