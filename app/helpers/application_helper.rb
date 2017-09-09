module ApplicationHelper

  def active_class(video, current)
    video == current ? 'active' : ''
  end

  def has_viewed(user, video)
    View.where(user_id: user, video_id: video, played: true).any? ? true : false
  end

  def has_incomplete_view(user, video)
    View.where(user_id: user, video_id: video, played: false).any? ? true : false
  end

end
