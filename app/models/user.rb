class User < ActiveRecord::Base
  attr_accessible :name, :password, :username

  before_validation :generate_token, :on => :create

  has_many :followings,
      :class_name => "Following",
      :foreign_key => :user_id,
      :primary_key => :id

  has_many :followees,
  :through => :followings,
  :source => :followee

  has_many :followings_of_user,
  :class_name => "Following",
  :foreign_key => :followee_id,
  :primary_key => :id

  has_many :followers,
  :through => :followings_of_user,
  :source => :follower

  def generate_token
    self.token = SecureRandom.urlsafe_base64
  end

end
