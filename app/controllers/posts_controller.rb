class PostsController < ApplicationController
  before_filter :authenticate_superadmin!, except: [:index, :show]

  def index
    @posts = Post.order('created_at desc').first(10)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new params[:post]
    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end
end
