class RenameAssociationColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :schools, :association, :assn
  end
end
