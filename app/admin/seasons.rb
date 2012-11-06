ActiveAdmin.register Season do
  index do
    column :id
    column 'Sport' do |season|
      season.sport_id
    end
    column :year
    column :start_date
    column :current
    default_actions
  end

  form do |f|
    f.inputs do
      f.input :year
      f.input :sport_id
      f.input :start_date
      f.input :current
    end
    f.buttons
  end
end
