class ApplicationMailer < ActionMailer::Base
  default from: "postmaster@sandbox19cea8ca41934b999239a8d8ac49aea0.mailgun.org" #'from@example.com'
  layout 'mailer'
end
