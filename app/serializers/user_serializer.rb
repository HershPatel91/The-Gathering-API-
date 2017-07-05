class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :gender, :age, :description, :picture
  has_many :attended_events 
  has_many :attending_events

  def attended_events
  	events = PartyGuest.where(guest_id: @object.id, approved: true)
  	attended_events = events.select{|event| event.party.date <  Date.today }
  end

  def attending_events
  	events = PartyGuest.where(guest_id: @object.id, approved: true)
  	attended_events = events.select{|event| event.party.date >  Date.today }
  end

end
