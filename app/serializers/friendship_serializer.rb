class FriendshipSerializer < ActiveModel::Serializer
  attributes :id, :user, :friend, :status
end
