class VideosController < ApplicationController
  before_action :authenticate_user!
  def show
    @course = Course.find(params[:course_id])
    @videos = @course.videos
    @video = Video.find(params[:id])
    @views = @course.views.user_views(current_user.id)
    @next_video = Video.where(course_id: @course.id, week: @video.week, order_in_week: @video.order_in_week+1).first
    if @video.week != @course.total_weeks && @next_video.nil?
      @next_video = Video.where(course_id: @course.id, week: @video.week+1, order_in_week: 1).first
    end
  end
end