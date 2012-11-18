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
      flash[:notice] = "Post created."
      redirect_to home_path
    else
      flash.now[:error] = @post.errors.full_messages
      render "new"
    end
  end
end
