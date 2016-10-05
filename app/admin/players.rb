ActiveAdmin.register Player do

  controller do
    def permitted_params
      params.permit(player: [
        :school,
        :first_name,
        :last_name,
        :middle_initial
      ])
    end
  end
end
