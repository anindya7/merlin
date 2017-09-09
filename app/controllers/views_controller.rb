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

  def view_params
    params.permit(:user_id, :video_id, :course_id, :played)
  end

end