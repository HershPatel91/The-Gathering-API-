class PartySerializer < ActiveModel::Serializer
  attributes :id, :title, :date, :time, :description, :location_area, :location, :capacity, :admin_id, :image, :cover, :latitude, :longitude
  has_one :admin
  has_many :approved_guests, serializer: PartyGuestSerializer
  has_many :applied_guests, serializer: PartyGuestSerializer
  has_many :rejected_guests, serializer: PartyGuestSerializer
  has_many :messages

  def approved_guests
  	PartyGuest.where(party_id: @object.id, status: "approved")
  end

  def applied_guests
  	PartyGuest.where(party_id: @object.id, status: "applied")
  end

  def rejected_guests
  	  PartyGuest.where(party_id: @object.id, status: "rejected")
  end

  def time
  	hour = @object.time.slice(0,2).to_i
  	minutes = @object.time.slice(3,5)
  	if hour < 12
  		"#{hour}:#{minutes} AM"
  	else
  		"#{hour-12}:#{minutes} PM"
  end
end

end
