class Api::V1::PartiesController < ApplicationController
  before_action :authorize_user!

  def index
    parties = Party.all
    render json: students
  end

  def create
    party = Party.create(party_params)
    render json: party
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
    params.require(:party).permit(:name, :date, :location, :description, :ratings, :admin)
  end
end
