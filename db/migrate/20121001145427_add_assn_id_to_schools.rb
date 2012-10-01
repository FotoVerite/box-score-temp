class AddAssnIdToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :assn_id, :integer
  end
end
