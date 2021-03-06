ActiveAdmin.register Admin do
  index do
    column :id
    column :first_name
    column :last_name
    column :email
    column 'School' do |admin|
      admin.school.try(:name)
    end
    column :last_sign_in_at
    actions
  end

  form do |f|
    f.inputs do
      f.input :school, as: :select, collection: School.ordered
      f.input :email
      f.input :first_name
      f.input :last_name
      if current_admin.superadmin?
        f.input :sub_editor, label: "Sub Editor"
      end
    end
    if f.object.new_record?
      f.inputs do
        f.input :password
        f.input :password_confirmation
      end
    end
    f.actions
  end

  controller do
    def permitted_params
      params.permit(admin: [
        :school,
        :school_id,
        :email,
        :first_name,
        :last_name,
        :password,
        :password_confirmation,
        :sub_editor
      ])
    end
  end

end
