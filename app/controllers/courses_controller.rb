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
    @next_page = @course.next_page(current_user)
  end
end