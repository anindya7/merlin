class Course < ApplicationRecord
  has_many :videos, dependent: :destroy
  has_many :views, dependent: :destroy
  has_many :quizzes, class_name: 'Quiz', dependent: :destroy
  has_many :quiz_scores, class_name: 'QuizScore', dependent: :destroy

  validates_presence_of :total_weeks, :name, :description
  validates_uniqueness_of :name

  def next_page(user)
    unless self.views.where(played: false).last.nil?
      @next_page = Video.find(self.views.where(played: false).last.video_id)
    else
      # Find last viewed video
      last_view = self.views.user_views(user.id).last
      if last_view.nil?
        @next_page = self.videos.ordered_in_week(1).first
      else
        last_video = Video.find(last_view.video_id)
        unless last_video.nil?
          @next_page = last_video.next_page
          if @next_page.nil?
            # Find first/quiz video not viewed
            @next_page = self.videos.ordered_in_week(1).first
          elsif @next_page.is_a?(Quiz) && QuizScore.where(user_id: user.id, quiz_id: @next_page.id).any?
            @next_page = @next_page.next_page
          end
        else
          @next_page = self.videos.ordered_in_week(1).first
        end
      end
    end
    @next_page
  end
end
