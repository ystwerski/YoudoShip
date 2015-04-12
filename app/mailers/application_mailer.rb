class ApplicationMailer < ActionMailer::Base
  default from: ENV['gmail_username']
end
