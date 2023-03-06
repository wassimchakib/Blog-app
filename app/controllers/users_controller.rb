class UsersController < ApplicationController
  def index
    @users = User.includes(:posts)
  end

  def show
    @user = User.find_by(id: params[:id]) || "No User found with id #{params[:id]}"
  end
end
