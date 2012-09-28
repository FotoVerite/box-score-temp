class RemoveCityFromSchools < ActiveRecord::Migration
  def up
    remove_column :schools, :city
  end

  def down
    add_column :schools, :city, :string
  end
end
