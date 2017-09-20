class ApplicationMailer < ActionMailer::Base
  default from: "support@calmindia.co" # "Calm India <support@calmindia.com>"
  layout 'mailer'
end
