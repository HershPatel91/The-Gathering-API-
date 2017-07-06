class User < ApplicationRecord
	has_secure_password
	has_many :friendships
	has_many :friends, class_name: 'User', through: :friendships 
	has_many :party_guests, foreign_key: "guest_id"
	has_many :guest_parties, through: :party_guests, source: :party
	has_many :hosted_parties, class_name:'Party', foreign_key: "admin_id"
end
