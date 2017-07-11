class Api::V1::MessagesController < ApplicationController
  # before_action :authorize_user!

  def index
    messages = Message.all
    render json: parties
  end

  def create
    message = Message.create(message_params)
    parties = Party.all
    render json: parties
  end

  def show 
    message = Message.find(params[:id])
    render json:message
  end

  def update
    message = Message.find(params[:id])
    message.update(party_params)
    render json: message
  end

  def destroy
    message = Message.find(params[:id])
    message.destroy
    render json: message
  end

  private

  def message_params
    params.require(:party).permit(:message, :user_id, :party_id)
  end
end
