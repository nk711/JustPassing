class ApplicationMailer < ActionMailer::Base
#Some default settings
  default to: "System@JustPassing.com", from: "System@JustPassing.com"
  layout 'mailer'
end
