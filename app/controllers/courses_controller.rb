class CoursesController < ApplicationController
  before_action :authenticate_user!
  def index
    @courses = Course.all
  end

  def show
    @course = Course.find(params[:id])
    @views = @course.views.user_views(current_user.id)
    @videos = @course.videos
    unless @videos.count == @views.count && @views.count == 0  
      unless @course.views.where(played: false).last.nil?
        @next_video = Video.find(@course.views.where(played: false).last.video_id)
      else
        last_video = Video.find(@views.last.video_id)
        @next_video = Video.where(course_id: @course.id, week: last_video.week, order_in_week: last_video.order_in_week+1).first
        if @next_video.nil?
          @next_video = Video.where(course_id: @course.id, week: last_video.week+1, order_in_week: 1).first
          if @next_video.nil?
            @next_video = @videos.ordered_in_week(1).first
          end
        end
      end
    end 
  end
end