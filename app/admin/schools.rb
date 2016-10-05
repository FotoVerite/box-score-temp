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
    actions
  end

  controller do
    def permitted_params
      params.permit(school: [
                      :address_1,
                      :address_2,
                      :assn_id,
                      :athletic_director_email,
                      :athletic_director_name,
                      :athletic_director_phone,
                      :mascot,
                      :name,
                      :short_name
                    ])
    end
  end
end
