class View < ApplicationRecord
  belongs_to :user
  belongs_to :course
  belongs_to :video

  validates_presence_of :user_id, :course_id, :video_id, :played
  validates_uniqueness_of :user_id, scope: [:course_id, :video_id]

  def self.user_views(user)
    where(user_id: user, played: true)
  end

  def completed
    where(played: true)
  end
end
