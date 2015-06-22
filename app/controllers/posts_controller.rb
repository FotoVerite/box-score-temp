class PostsController < ApplicationController
  before_filter :authenticate_superadmin!, except: [:index, :show]

  def index
    @posts = Post.order('created_at desc').first(10)
  end

  def show
    post
  end

  def new
    @post = Post.new(game_id: params[:game_id])
  end

  def create
    @post = Post.new params[:post]
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
    if post.update_attributes(params[:post])
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
    @post ||= Post.find(params[:id])
  end
end
