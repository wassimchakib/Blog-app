class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.author_id = current_user.id
    @comment.post_id = params[:post_id]
    post = Post.find(params[:post_id])
    if @comment.save
      redirect_to user_posts_path(user_id: params[:user_id])
    else
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :post_id)
  end
end
