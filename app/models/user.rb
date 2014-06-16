class User < ActiveRecord::Base
  has_many :participants
  has_many :conversations, through: :participants

  has_many :friendships
  has_many :friends, through: :friendships
end
