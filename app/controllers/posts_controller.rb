class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
  
    if @post.save
      redirect_to users_path
    else
      render :new
    end
  end

  def index
    @posts = User.find_by(id: params[:user_id])&.posts || []
  end

  def show
    @post = Post.find_by(author_id: params[:user_id], id: params[:id]) || "No posts found for User #{params[:id]}"
  end

  private

  def post_params
    params.require(:post).permit(:title, :text).merge(author: current_user)
  end
end
