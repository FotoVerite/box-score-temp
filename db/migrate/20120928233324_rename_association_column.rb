class RenameAssociationColumn < ActiveRecord::Migration
  def change
    rename_column :schools, :association, :assn
  end
end
