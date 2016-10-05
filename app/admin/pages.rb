ActiveAdmin.register Page do
  index do
    column :id
    column :title
    column :slug
    column 'content' do |page|
      truncate(page.content, length: 100)
    end
    column :updated_at
    actions
  end

  show do
    attributes_table do
      row :title
      row :slug
      row :updated_at
      row :content do
        markdown_content(page.content)
      end
    end
  end

  controller do
    def permitted_params
      params.permit(page: [:content, :title, :slug])
    end
  end
end
