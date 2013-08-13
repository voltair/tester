class Following < ActiveRecord::Base
  attr_accessible :followee_id, :user_id

  belongs_to :followee,
        :class_name => "User",
        :foreign_key => :followee_id,
        :primary_key => :id

  belongs_to :follower,
  :class_name => "User",
  :foreign_key => :user_id,
  :primary_key => :id

end
