class FollowingRelationship < ApplicationRecord
  belongs_to :follower, class_name: "User", counter_cache: :followed_users_count
  belongs_to :followed_user, class_name: "User", counter_cache: :followers_count

  validates :follower_id, uniqueness: {scope: :followed_user_id}
  validates :follower_id, exclusion: { in: ->(rel) { [rel.followed_user_id] }, message: "Cannot follow yourself" }
end
