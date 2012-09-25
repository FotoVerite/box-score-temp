class AddSchoolIdToAdmins < ActiveRecord::Migration
  def change
    add_column :admins, :school_id, :int
  end
end
