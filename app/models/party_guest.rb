class PartyGuest < ApplicationRecord
	belongs_to :guest, class_name: "User", foreign_key: "guest_id"
	belongs_to :party




	
end
