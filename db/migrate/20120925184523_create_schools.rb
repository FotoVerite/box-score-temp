class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :name
      t.string :mascot
      t.string :type
      t.string :city
      t.string :state

      t.timestamps
    end
  end
end
