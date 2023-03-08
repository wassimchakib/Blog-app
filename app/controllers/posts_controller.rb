class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.commentsCounter = 0
    @post.likesCounter = 0

    if @post.save
      flash[:success] = 'Post saved successfully'
      redirect_to user_posts_path(params[:user_id])
    else
      flash[:error] = "Invalid input, post didn't get saved"
      render :new
    end
  end

  def index
    @posts = User.find_by(id: params[:user_id])&.posts&.includes(:comments) || []
  end

  def show
    @post = Post.find_by(author_id: params[:user_id], id: params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:title, :text).merge(author: current_user)
  end
end
