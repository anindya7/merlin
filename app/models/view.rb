class View < ApplicationRecord
  belongs_to :user
  belongs_to :course
  belongs_to :video

  def self.user_views(user)
    where(user_id: user, played: true)
  end

  def completed
    where(played: true)
  end
end
