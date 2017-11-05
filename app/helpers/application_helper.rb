module ApplicationHelper

  def active_class(each, current)
    each == current ? 'active' : ''
  end

  def has_viewed(user, video)
    View.where(user_id: user, video_id: video, played: true).any? ? true : false
  end

  def has_incomplete_view(user, video)
    View.where(user_id: user, video_id: video, played: false).any? ? true : false
  end

  def has_taken_quiz(user, quiz)
    QuizScore.where(user_id: user, quiz_id: quiz).any? ? true : false
  end

  # def resource_name
  #   :user
  # end

  # def resource
  #   @resource ||= User.new
  # end

  # def devise_mapping
  #   @devise_mapping ||= Devise.mappings[:user]
  # end

end
