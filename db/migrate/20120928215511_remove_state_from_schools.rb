class RemoveStateFromSchools < ActiveRecord::Migration
  def up
    remove_column :schools, :state
  end

  def down
    add_column :schools, :state, :string
  end
end
