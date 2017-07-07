class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :gender, :age, :description, :picture
  has_many :attended_events 
  has_many :attending_events
  has_many :applied_events
  has_many :hosted_events
  has_many :incoming_friend_requests
  has_many :friends


  def attended_events
  	events = PartyGuest.where(guest_id: @object.id, status: "approved")
  	attended_events = events.select{|event| event.party.date <  Date.today }
  end

  def attending_events
    events = PartyGuest.where(guest_id: @object.id, status: "approved")
    attended_events = events.select{|event| event.party.date >  Date.today }
  end

  def applied_events
    events = PartyGuest.where(guest_id: @object.id, status: "applied")
    applied_events = events.select{|event| event.party.date >  Date.today }
  end

  def hosted_events
  	events = Party.where(admin_id: @object.id)
  	hosted_events = events.select{|event| event.date >  Date.today }
  end

  def incoming_friend_requests
    incoming_friend_requests = Friendship.where(related_user_id: @object.id, status: "requested")
  end

  def friends
      friends = Friendship.where(user_id: @object.id, status: "approved").or(Friendship.where(related_user_id: @object.id, status: "approved"))
  end

  # def applied_guests
  #   events = Party.where(admin_id: @object.id)
  #   hosted_events = events.select{|event| event.date >  Date.today }
  #   byebug
  #   applied_guest = hosted_events.map {|event| event.party_guests.where(approved: false)}
  # end

end
