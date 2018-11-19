class AddShortNameToSchools < ActiveRecord::Migration[5.2]
  def change
    add_column :schools, :short_name, :string
  end
end
