class Api::V1::UsersController < ApplicationController
  # before_action :authorize_user!

  def index
    users = User.all
    render json: users
  end  

  def create
    user = User.create(user_params)
    render json: user
  end

  def show 
    user = User.find(params[:id])
    render json:user
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    render json: user
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    render json: user
  end

  private

  def user_params
    params.require(:user).permit(:email, :password_digest, :name, :gender, :age, :description, :picture)
  end
end
