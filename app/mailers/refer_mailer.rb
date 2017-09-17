class ReferMailer < ApplicationMailer

  def welcome_mail(user)
    @user = user
    mail :subject => "CalmIndia - Thank you for joining us!",
      :to => user.email,
      :from => "Calm India <support@alphadeal.co>", # "Calm India <support@calmindia.com>",
      :template_name => 'welcome'
  end

  def invite_mail(name, email, refer_name, refer_email)
    @email = email
    @name = name
    @refer_email = refer_email
    @refer_name = refer_name
    mail :subject => "CalmIndia - You have been invited!",
      :to => refer_email,
      :from => "Calm India <support@alphadeal.co>", # "Calm India <support@calmindia.com>",
      :template_name => 'invite'
  end
end