class Api::V1::PartiesController < ApplicationController
  # before_action :authorize_user!

  def index
    parties = Party.all
    render json: parties
  end

  def create
    party = Party.create(party_params)
    render json: party
  end

  def show 
    party = Party.find(params[:id])
    render json:party
  end

  def update
    party = Party.find(params[:id])
    party.update(party_params)
    render json: party
  end

  def destroy
    party = Party.find(params[:id])
    party.destroy
    render json: party
  end

  private

  def party_params
    params.require(:party).permit(:title, :date, :location, :description, :capacity, :image, :rating, :admin_id, :location_area, :cover, :time)
  end
end
