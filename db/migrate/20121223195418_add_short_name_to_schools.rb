class AddShortNameToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :short_name, :string
  end
end
