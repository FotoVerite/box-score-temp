ActiveAdmin.register League do
  index do
    column :id
    column :name
    column :classification
    actions
  end

  controller do
    def permitted_params
      params.permit(league: [:assn_id, :classification, :name])
    end
  end

end
