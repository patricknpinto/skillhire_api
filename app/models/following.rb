class Following < ApplicationRecord
  belongs_to :follower, class_name: 'User'
  belongs_to :followed, class_name: 'User'

  validates :follower, uniqueness: { scope: :followed }
  validate :following_itself?

  def following_itself?
    errors.add(:follower, 'Cant follow itself') if follower == followed
  end
end
