class Api::V1::PartyGuestsController < ApplicationController
  # before_action :authorize_user!

  def index
    partyguests = PartyGuest.all
    render json: partyguests
  end

  def create
    partyguest = PartyGuest.create(party_guest_params)
    render json: partyguest
  end

  def update
    partyguest = PartyGuest.find(params[:id])
    partyguest.update(party_guest_params)
    parties = Party.all
    render json: parties
  end

  def destroy
    partyguest = PartyGuest.find(params[:id])
    partyguest.destroy
    render json: partyguest
  end

  private

  def party_guest_params
    params.require(:partyguest).permit(:guest_id, :party_id, :status)
  end
end
