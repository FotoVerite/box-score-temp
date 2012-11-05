ActiveAdmin.register School do
  index do
    column :id
    column :name
    column :mascot
    column :address_1
    column :address_2
    column :athletic_director_name
    column :athletic_director_email
    column :athletic_director_phone
    default_actions
  end
end
