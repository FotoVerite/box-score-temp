ActiveAdmin.register Team do
  actions :all, except: [:destroy]

  index do
    column :id
    column :display_name
    column :coach_name
    column :coach_email
    column :coach_phone
    actions
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
    f.actions
  end

  controller do
    def permitted_params
      params.permit(team: [
          :coach_email,
          :coach_name,
          :coach_phone,
          :competitive_class,
          :name,
          :leage_id,
          :school_id,
          :season_id
        ]
      )
    end
  end

end
