class AddSchoolIdToAdmins < ActiveRecord::Migration[5.2]
  def change
    add_column :admins, :school_id, :int
  end
end
