class ReferMailer < ApplicationMailer

  def invite_mail(name, email, refer_name, refer_email)
    @email = email
    @name = name
    @refer_email = refer_email
    @refer_name = refer_name
    mail :subject => "CalmIndia - You have been invited!",
      :to => refer_email,
      :from =>  "Calm India <support@calmindia.com>",
      :template_name => 'invite'
  end
end