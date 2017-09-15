class CoursesController < ApplicationController
  before_action :authenticate_user!
  def index
    @courses = Course.all
  end

  def show
    @course = Course.find(params[:id])
    @views = @course.views.user_views(current_user.id)
    @quizzes_taken = @course.quiz_scores.user_taken(current_user.id)
    @videos = @course.videos
    @quizzes = @course.quizzes

    # Check for Previous half played video
    unless @course.views.where(played: false).last.nil?
      @next_page = Video.find(@course.views.where(played: false).last.video_id)
    else
      # Find last viewed video
      last_video = Video.find(@views.last.video_id)
      unless last_video.nil?
        @next_page = last_video.next_page
        if @next_page.nil?
          # Find first/quiz video not viewed
          @next_page = @videos.ordered_in_week(1).first  
        end
      else
        @next_page = @videos.ordered_in_week(1).first
      end
    end
  end
end