class ApplicationMailer < ActionMailer::Base
  default from: "koan.mailer@gmail.com"
  layout 'mailer'
end
