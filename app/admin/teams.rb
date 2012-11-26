ActiveAdmin.register Team do
  index do
    column :id
    column :display_name
    column :coach_name
    column :coach_email
    column :coach_phone
    default_actions
  end

  form do |f|
    f.inputs do
      f.input :school, as: :select, collection: School.ordered
      f.input :season, as: :select, collection: Season.ordered
      f.input :league
      f.input :coach_name
      f.input :coach_email
      f.input :coach_phone
      f.input :competitive_class, label: 'Class'
    end
  end
end
