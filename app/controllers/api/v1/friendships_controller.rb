class Api::V1::FriendshipsController < ApplicationController
  # before_action :authorize_user!

 def index
    friendships = Friendship.all
    render json: friendships
  end

  def create
    friend = Friendship.create(friend_params)
    render json: friend
  end

  def update
    friend = Friendship.find(params[:id])
    friend.update(friend_params)
    users = User.all
    render json: users
  end

  def destroy
    friend = Friendship.find(params[:id])
    friend.destroy
    render json: friend
  end

  private

  def friend_params
    params.require(:friendship).permit(:user_id, :related_user_id, :status)
  end
end
