class WelcomeMailer < ApplicationMailer
  def user(user)
    mail(to: user.email, subject: "welcome")
  end
end
