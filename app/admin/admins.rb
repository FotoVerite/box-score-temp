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
    default_actions
  end

  form do |f|
    f.inputs do
      f.input :school, as: :select, collection: School.ordered
      f.input :email
      f.input :first_name
      f.input :last_name
    end
    if f.object.new_record?
      f.inputs do
        f.input :password
        f.input :password_confirmation
      end
    end
    f.buttons
  end
end
