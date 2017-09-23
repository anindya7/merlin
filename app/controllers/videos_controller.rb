require 'open-uri'

class VideosController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @course = Course.find(params[:course_id])
    @videos = @course.videos
    @quizzes = @course.quizzes
    @views = @course.views.user_views(current_user.id)
    @quizzes_taken = @course.quiz_scores.user_taken(current_user.id)
    @video = Video.find(params[:id])
    @next_page = @video.next_page
  end

  def download_pdf
    video = Video.find(params[:id])
    url = video.pdf_url.sub('http://', '')
    url = url.sub('https://', '')
    data = open("http://#{url}") 
    send_data data.read, filename: "#{video.name}.pdf", type: "application/pdf", disposition: 'attachment'
  end

  def download_audio
    # download = open('https://upload.wikimedia.org/wikipedia/en/3/33/Silicon_valley_title.png')
    # IO.copy_stream(download, '~/image.png')
    data = open("http://www.sample-videos.com/audio/mp3/crowd-cheering.mp3") 
    send_data data.read, filename: "w1v1.mp3", type: "audio/mpeg3",  stream: 'true', buffer_size: '4096'
  end
end