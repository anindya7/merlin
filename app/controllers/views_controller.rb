class ViewsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @prev_view = View.where(user_id: params[:user_id], video_id: params[:video_id], course_id: params[:course_id]).first
    if @prev_view.nil?
      @view = View.new(view_params)
      @view.save
    else
      @prev_view.played = params[:played]
      @prev_view.save
    end
  end

  def complete
    @prev_view = View.where(user_id: params[:user_id], video_id: params[:video_id], course_id: params[:course_id]).first
    if @prev_view.nil?
      @view = View.new(view_params)
      @view.save
    else
      @prev_view.played = params[:played]
      @prev_view.save
    end

    @course = Course.find(params[:course_id])
    @views = @course.views.user_views(current_user.id)
    @videos = @course.videos
    if  !(@videos.count == @views.count) && !(@views.count == 0)  
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
    if @next_video.nil?
      flash[:notice] = "#{@course.name} Course Completed"
      redirect_to courses_path
    else
      redirect_to course_video_path(@course, @next_video)
    end
  end

  def view_params
    params.permit(:user_id, :video_id, :course_id, :played)
  end

end