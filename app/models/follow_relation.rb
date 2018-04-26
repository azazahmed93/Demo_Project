class FollowRelation < ActiveRecord::Base
  belongs_to :follower, calss_name => 'User'
  belongs_to :following, class_name =>'User'
end
