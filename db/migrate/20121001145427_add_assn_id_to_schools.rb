class AddAssnIdToSchools < ActiveRecord::Migration[5.2]
  def change
    add_column :schools, :assn_id, :integer
  end
end
