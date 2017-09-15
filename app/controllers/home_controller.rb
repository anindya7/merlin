class HomeController < ApplicationController
  before_action :check_guest, only: [:index]

  def index 
  end

  def cc
  end
end