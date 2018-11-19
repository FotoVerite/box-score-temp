class RemoveAssnFromSchools <  ActiveRecord::Migration[5.2]
  def up
    remove_column :schools, :assn
  end

  def down
    add_column :schools, :assn, :string
  end
end
