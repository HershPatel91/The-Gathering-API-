class Party < ApplicationRecord
	belongs_to :admin, class_name: "User", foreign_key: "admin_id"
	has_many :party_guests
	has_many :guests, class_name: "User", 	through: :party_guests
end
