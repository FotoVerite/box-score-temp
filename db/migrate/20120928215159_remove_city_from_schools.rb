class RemoveCityFromSchools <  ActiveRecord::Migration[5.2]
  def up
    remove_column :schools, :city
  end

  def down
    add_column :schools, :city, :string
  end
end
