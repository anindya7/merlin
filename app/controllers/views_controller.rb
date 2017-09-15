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
    @quizzes_taken = @course.quiz_scores.user_taken(current_user.id)
    @videos = @course.videos
    @quizzes = @course.quizzes
    @video = Video.find(params[:video_id])
    @next_page = @video.next_page

    if @next_page.nil?
      if @views.count + @quizzes_taken.count == @videos.count + @quizzes.count
        flash[:notice] = "#{@course.name} Course Completed"
        redirect_to course_path(@course)
      else
        @next_page = @videos.ordered_in_week(1).first
        redirect_to course_video_path(@course, @next_page)
      end
    elsif @next_page.is_a?(Video)
      redirect_to course_video_path(@course, @next_page)
    elsif @next_page.is_a?(Quiz)
      redirect_to course_quiz_path(@course, @next_page)
    end
  end

  def view_params
    params.permit(:user_id, :video_id, :course_id, :played)
  end

end