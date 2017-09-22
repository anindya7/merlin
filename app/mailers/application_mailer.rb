class ApplicationMailer < ActionMailer::Base
  default from: "support@calmindia.com" # "Calm India <support@calmindia.com>"
  layout 'mailer'
end
