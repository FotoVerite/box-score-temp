class ChangeNameToFirstNameLastNameOnPlayers < ActiveRecord::Migration
  def up
    change_table :players do |t|
      t.rename :name, :first_name
      t.string :last_name
    end
  end

  def down
    change_table :players do |t|
      t.rename :first_name, :name
      t.remove :last_name
    end
  end
end
