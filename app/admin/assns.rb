ActiveAdmin.register Assn do
  index do
    column :id
    column :name
    actions
  end

  controller do
    def permitted_params
      params.permit(assn: [:name])
    end
  end
end
