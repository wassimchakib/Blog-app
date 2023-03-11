class Api::UsersController < ApplicationController
  include Rswag::Api::Controller

  swagger_controller :users, 'User Management'

  swagger_api :index do
    summary 'Fetches all User items'
    notes 'This lists all the User items'
    response :ok, 'Success', :json
    response :unauthorized
    response :unprocessable_entity
  end

  def index
    @users = User.all.select('name, id, bio, email')
    render json: @users
  end

  def show
    @user = User.select('name, id, bio, email').find(params[:id])
    render json: @user
  end

  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
  end
end
