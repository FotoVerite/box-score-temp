class AddMiddleInitialToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :middle_initial, :string
  end
end
