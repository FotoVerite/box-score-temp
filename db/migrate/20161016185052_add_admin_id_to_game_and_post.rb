class AddAdminIdToGameAndPost < ActiveRecord::Migration[5.0]
  def up
    unless column_exists?(:games, :admin_id)
      add_column :games, :admin_id, :integer
      add_column :posts, :admin_id, :integer
      add_index :games, :admin_id
      add_index :posts, :admin_id
    end
  end

   def down
    remove_column :games, :admin_id
    remove_column :posts, :admin_id
  end
end
