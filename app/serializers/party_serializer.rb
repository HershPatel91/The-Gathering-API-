class PartySerializer < ActiveModel::Serializer
  attributes :id, :title, :date, :time, :description, :location_area, :location, :capacity, :admin_id, :image, :cover, :latitude, :longitude
  has_one :admin
  has_many :approved_guests, serializer: PartyGuestSerializer

  def approved_guests
  	PartyGuest.where(party_id: @object.id, approved: true)
  end

end
