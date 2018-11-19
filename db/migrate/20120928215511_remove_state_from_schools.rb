class RemoveStateFromSchools <  ActiveRecord::Migration[5.2]
  def up
    remove_column :schools, :state
  end

  def down
    add_column :schools, :state, :string
  end
end
