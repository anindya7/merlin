class ReferMailer < ApplicationMailer

  def welcome_mail(user)
    @user = user
    mail :subject => "",
      :to => user.email,
      :from => "",
      :template_name => 'welcome'
  end

  def invite_mail(name, email, refer_name, refer_email)
    @email = email
    @name = name
    @refer_email = refer_email
    @refer_name = refer_name
    mail :subject => "",
      :to => refer_email,
      :from => "",
      :template_name => 'invite'
  end
end