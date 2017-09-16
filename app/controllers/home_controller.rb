class HomeController < ApplicationController
  before_action :check_guest, only: [:index]

  def index 
  end

  def refer

  end

  def submit_refer
    referral = params[:refer]
    Referral.create(name: referral[:name], email: referral[:email], refer_name: referral[:refer_name], refer_email: referral[:refer_email])
    # ReferMailer.invite_mail(referral[:name], referral[:email], referral[:refer_name], referral[:refer_email]).deliver
    flash[:notice] = "You have successfully referred your friend!"
    redirect_to refer_path
  end
end