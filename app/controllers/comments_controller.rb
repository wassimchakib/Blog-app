class CommentsController < ApplicationController
  load_and_authorize_resource

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.author_id = current_user.id
    @comment.post_id = params[:post_id]
    if @comment.save
      redirect_to user_posts_path(user_id: params[:user_id])
    else
      render :new
    end
  end

  def destroy
    @comment.destroy
    flash[:success] = 'The comment was deleted successfully'
    redirect_to user_post_path(current_user.id)
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
