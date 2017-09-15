class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  layout :layout_by_resource

  def layout_by_resource
    if (devise_controller? && resource_name == :user && action_name != 'edit') || 
      (controller_name.eql?('home') && action_name == 'index')
      "homepages"
    else
      "application"
    end
  end

  def check_guest
    if user_signed_in?
      redirect_to courses_path
    end
  end

  def after_sign_in_path_for(resource)
    courses_path
  end
end
