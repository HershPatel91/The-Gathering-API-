class Friendship < ApplicationRecord
  	belongs_to :user
	belongs_to :friend, :class_name => "User", :foreign_key => "related_user_id"
end
