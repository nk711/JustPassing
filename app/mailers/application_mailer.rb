class ApplicationMailer < ActionMailer::Base
  default to: "System@JustPassing.com", from: "System@JustPassing.com"
  layout 'mailer'
end
