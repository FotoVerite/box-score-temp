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
    f.buttons
  end

  controller do
    def permitted_params
      params.permit(season: [
        :address_1,
        :address_2,
        :athletic_director_email,
        :athletic_director_name,
        :athletic_director_phone,
        :assn_id,
        :mascot,
        :name,
        :short_name
      ])
    end
  end

end
