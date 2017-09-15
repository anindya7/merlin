class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def check_guest
    if user_signed_in?
      redirect_to courses_path
    end
  end

  def after_sign_in_path_for(resource)
    courses_path
  end
end
