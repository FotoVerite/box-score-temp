class RenameTitleColumnOnSchools < ActiveRecord::Migration
  def up
    rename_column :schools, :type, :organization_type
  end

  def down
    rename_column :schools, :organization_type, :type
  end
end
