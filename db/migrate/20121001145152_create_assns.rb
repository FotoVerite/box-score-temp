class CreateAssns < ActiveRecord::Migration
  def change
    create_table :assns do |t|
      t.string :name

      t.timestamps
    end
  end
end
