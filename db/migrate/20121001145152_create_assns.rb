class CreateAssns < ActiveRecord::Migration[5.2]
  def change
    create_table :assns do |t|
      t.string :name

      t.timestamps
    end
  end
end
