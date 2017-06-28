class User < ApplicationRecord
	has_many :friendships
	has_many :friends, class_name: 'User', through: :friendships 
	has_many :party_guests
	has_many :parties, through: :party_guests
	has_many :hosted_parties, class_name:'Party', foreign_key: "admin_id"
end
