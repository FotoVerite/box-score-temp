class RemoveAssnFromSchools < ActiveRecord::Migration
  def up
    remove_column :schools, :assn
  end

  def down
    add_column :schools, :assn, :string
  end
end
