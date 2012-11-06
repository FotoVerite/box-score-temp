ActiveAdmin.register Admin do
  index do
    column :id
    column :first_name
    column :last_name
    column :email
    column 'School' do |admin|
      admin.school.name
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
      f.input :password
      f.input :password_confirmation
    end
    f.buttons
  end
end
