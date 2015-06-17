ActiveAdmin.register Post do
  index do
    column :id
    column :title
    column :excerpt
    column :body
    column :created_at
  end
end
