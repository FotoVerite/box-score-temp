ActiveAdmin.register Post do
  index do
    column :id
    column :title
    column :excerpt
    column :body
    column :published_at
    column :created_at
    actions
  end

  controller do
    def new
      redirect_to new_post_path
    end

    def edit
      redirect_to edit_post_path(params[:id])
    end

    def show
      redirect_to post_path(params[:id])
    end
  end
end
