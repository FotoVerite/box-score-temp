class RenameOrganizationTypeToAssociationOnSchools < ActiveRecord::Migration
  def up
    rename_column :schools, :organization_type, :association
  end

  def down
    rename_column :schools, :association, :organization_type
  end
end
