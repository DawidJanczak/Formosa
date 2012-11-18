class PostsController < ApplicationController
  def index
    @posts = Post.paginate(page: params[:page])
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(params[:post])
    if @post.save
      flash[:success] = "Post created."
    else
      flash[:error] = "Port could not be created."
    end
    redirect_to home_path
  end
end
