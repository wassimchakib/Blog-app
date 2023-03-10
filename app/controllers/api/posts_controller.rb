class Api::PostsController < ApplicationController
  include Rswag::Api::Controller

  swagger_controller :posts, 'Post Management'

  swagger_api :index do
    summary 'Fetches all post items'
    notes 'This lists all the post items'
    response :ok, 'Success', :json
    response :unauthorized
    response :unprocessable_entity
  end
  def index
    @posts = Post.where(author_id: user.id)
    render json: @posts
  end

  def show
    render json: @post
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      render json: @post, status: :created, location: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  def update
    if @post.update(post_params)
      render json: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end

  def user
    @user = User.find(params[:user_id])
  end
end
