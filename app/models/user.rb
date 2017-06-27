class User < ApplicationRecord
	has_many :friendships
	has_many :users, through: :friendships
	has_many :guests
	has_many :parties, through: :guests
	has_many :admins
	has_many :parties, through: :admins
end
