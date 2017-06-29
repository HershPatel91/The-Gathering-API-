class Api::V1::FriendshipsController < ApplicationController
  # before_action :authorize_user!

  def create
    friend = Friendship.create(party_guest_params)
    render json: friend
  end

  def update
    friend = Friendship.find(params[:id])
    friend.update(user_params)
    render json: friend
  end

  def destroy
    friend = Friendship.find(params[:id])
    friend.destroy
    render json: friend
  end

  private

  def user_params
    params.require(:friend).permit(:user_id, :related_user_id)
  end
end
