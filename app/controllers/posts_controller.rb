class PostsController < ApplicationController
  def index
    @posts = User.find_by(id: params[:user_id])&.posts || []
  end

  def show
    @post = Post.find_by(author_id: params[:user_id], id: params[:id]) || "No posts found for User #{params[:id]}"
  end
end
