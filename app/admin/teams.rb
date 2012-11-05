ActiveAdmin.register Team do
  index do
    column :id
    column :display_name
    column :coach_name
    column :coach_email
    column :coach_phone
    default_actions
  end
end
