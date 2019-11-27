class User < ApplicationRecord
  validates :name, :username, presence: true

  validates :username, uniqueness: true

  has_many :followings, foreign_key: 'followed_id', class_name: 'Following'
  has_many :followers, through: :followings

  def follow(follower)
    Following.create(follower: follower, followed: self)
  end

  def unfollow(follower)
    following = Following.find_by(follower: follower, followed: self)
    return false if following.nil?

    following.destroy
  end
end
