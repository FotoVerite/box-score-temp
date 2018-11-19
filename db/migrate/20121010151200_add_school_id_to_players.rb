class AddSchoolIdToPlayers < ActiveRecord::Migration[5.2]
  def change
    add_column :players, :school_id, :integer
  end
end
