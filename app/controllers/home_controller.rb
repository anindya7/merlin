class HomeController < ApplicationController
  before_action :check_guest, only: [:index]
  before_action :authenticate_user!, only: [:refer, :submit_refer]
  before_action :check_if_admin, only: [:admin_signin]
  def index 
  end

  def refer

  end

  def submit_refer
    referral = params[:refer]
    ref = Referral.new(name: referral[:name], refer_name: referral[:refer_name], refer_email: referral[:refer_email])
    ref.email = current_user.email
    if ref.save
      ReferMailer.invite_mail(referral[:name], current_user.email, referral[:refer_name], referral[:refer_email]).deliver_later
      flash[:notice] = "Thanks for referring your friend!"
      redirect_to courses_path
    else
      flash[:alert] = "Error occured while submiting form"
      redirect_to request.referrer
    end
  end

  def checkuser
    @user = User.where(email: params[:email])
    respond_to do |format|
      format.json {render :json => {email_exists: @user.any?}}
    end
  end

  def research

  end

  def admin_signin

  end

  private

    def check_if_admin
      if user_signed_in?
        if current_user.admin == true
          redirect_to rails_admin_path
        else
          redirect_to courses_path
        end
      end
    end
end