
class PostsController < ApplicationController
  before_action :authenticate_superadmin!, except: [:index, :show]

  def index
    @posts = Post.published?.order('created_at desc').paginate(page: params[:page], per_page: 16)
  end

  def show
    post
    @meta_description = ActionController::Base.helpers.strip_tags(@post.body)
.truncate(160) if @post
  end

  def new
    @post = Post.new(game_id: params[:game_id])
  end

  def create
    @post = Post.new post_params
    @post.admin_id = current_admin.id
    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def edit
    post
  end

  def update
    if post.update_attributes(post_params)
      redirect_to post
    else
      render 'edit'
    end
  end

  def destroy
    if post.destroy
      redirect_to posts_path
    else
      redirect_to posts_path
    end
  end

  private

  def post
    if superadmin_signed_in?
      @post = Post.friendly.find(params[:id])
    elsif current_admin 
      @post = Post.friendly.find(params[:id])
      return render_404 unless post.admin_id === current_admin.try(:id)
    else
      @post ||= Post.published?.friendly.find(params[:id])
    end
  end

  private

  def post_params
    params.require(:post).permit(
      :body,
      :email,
      :excerpt,
      :header_image,
      :game_id,
      :title
    )
  end
end
