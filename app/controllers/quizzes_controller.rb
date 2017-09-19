require 'open-uri'

class QuizzesController < ApplicationController
  before_action :authenticate_user!
  def show
    @course = Course.find(params[:course_id])
    @videos = @course.videos
    @quizzes = @course.quizzes
    @views = @course.views.user_views(current_user.id)
    @quizzes_taken = @course.quiz_scores.user_taken(current_user.id)
    @quiz = Quiz.find(params[:id])
    @next_page = @quiz.next_page
  end

  def skip
    @prev_quiz = QuizScore.where(user_id: params[:user_id], quiz_id: params[:quiz_id], course_id: params[:course_id]).first
    if @prev_quiz.nil?
      @qs = QuizScore.new(qs_params)
      @qs.taken = false
      @qs.save

      @course = Course.find(params[:course_id])
      @quiz = Quiz.find(params[:quiz_id])
      @views = @course.views.user_views(current_user.id)
      @quizzes_taken = @course.quiz_scores.user_taken(current_user.id)
      @videos = @course.videos
      @quizzes = @course.quizzes
      # Find his week quiz
      @next_page = @quiz.next_page
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
    else
      flash[:notice] = "Invalid Request"
      redirect_to courses_path
    end
  end

  def submit
    scores = params[:quiz_score][:questions]
    if scores.nil?
      flash[:alert] = "Please answer all questions and submit quiz."
      redirect_to request.referrer
    else
      @quiz = Quiz.find(params[:quiz_score][:quiz_id])
      if scores.values.count < @quiz.questions.where(mandatory: true).count
        flash[:alert] = "Please answer all questions and submit quiz."
        redirect_to request.referrer
      else
        @course = Course.find(params[:quiz_score][:course_id])
        @videos = @course.videos
        @quizzes = @course.quizzes

        @views = @course.views.user_views(current_user.id)
        @next_page = @quiz.next_page
        @total = 0
        scores.each do |key, value|
          if value.present?
            @total += value.to_i
          end
        end
        unless QuizScore.where(user_id: current_user.id, quiz_id: @quiz.id).any?
          QuizScore.create(
            user_id: current_user.id, 
            quiz_id: @quiz.id, 
            course_id: @course.id,
            taken: true
          )
        end
        render :show
      end
    end
  end

  def download_pdf
    # download = open('https://upload.wikimedia.org/wikipedia/en/3/33/Silicon_valley_title.png')
    # IO.copy_stream(download, '~/image.png')
    data = open("http://www.pdf995.com/samples/pdf.pdf") 
    send_data data.read, filename: "w1v1.pdf", type: "application/pdf", disposition: 'inline', stream: 'true', buffer_size: '4096'
  end

  def download_audio
    # download = open('https://upload.wikimedia.org/wikipedia/en/3/33/Silicon_valley_title.png')
    # IO.copy_stream(download, '~/image.png')
    data = open("http://www.sample-videos.com/audio/mp3/crowd-cheering.mp3") 
    send_data data.read, filename: "w1v1.mp3", type: "audio/mpeg3", disposition: 'inline', stream: 'true', buffer_size: '4096'
  end

  def qs_params
    params.permit(:user_id, :quiz_id, :course_id)
  end
end