class AddContactInfoToSchools < ActiveRecord::Migration[5.2]
  def change
    add_column :schools, :address_1, :string
    add_column :schools, :address_2, :string
    add_column :schools, :athletic_director_name, :string
    add_column :schools, :athletic_director_email, :string
    add_column :schools, :athletic_director_phone, :string
  end
end
