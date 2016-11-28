ActiveAdmin.register Season do
  index do
    column :id
    column 'Sport', &:sport_id
    column :year
    column :start_date
    column :current
    actions
  end

  form do |f|
    f.inputs do
      f.input :year
      f.input :sport_id, collection: Sport.all
      f.input :start_date
      f.input :current
    end
    f.actions
  end

  controller do
    def permitted_params
      params.permit(season: [
        :year,
        :sport_id,
        :start_date,
        :current
      ])
    end
  end

end
