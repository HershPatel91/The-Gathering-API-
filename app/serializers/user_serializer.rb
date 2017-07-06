class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :gender, :age, :description, :picture
  has_many :attended_events 
  has_many :attending_events
  has_many :applied_events
  has_many :hosted_events

  def attended_events
  	events = PartyGuest.where(guest_id: @object.id, approved: true)
  	attended_events = events.select{|event| event.party.date <  Date.today }
  end

  def attending_events
    events = PartyGuest.where(guest_id: @object.id, approved: true)
    attended_events = events.select{|event| event.party.date >  Date.today }
  end

  def applied_events
    events = PartyGuest.where(guest_id: @object.id, approved: false)
    applied_events = events.select{|event| event.party.date >  Date.today }
  end

  def hosted_events
  	events = Party.where(admin_id: @object.id)
  	hosted_events = events.select{|event| event.date >  Date.today }
  end

end
