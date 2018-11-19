class AddMiddleInitialToPlayers < ActiveRecord::Migration[5.2]
  def change
    add_column :players, :middle_initial, :string
  end
end
