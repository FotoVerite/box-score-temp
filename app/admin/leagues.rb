ActiveAdmin.register League do
  index do
    column :id
    column :name
    column :classification
    default_actions
  end
end
