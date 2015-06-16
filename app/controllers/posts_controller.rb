class PostsController < ApplicationController
  def index
    @posts = Post.last(10)
  end

  def show
    @post = Post.find(params[:id])
  end
end
