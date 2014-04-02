class UserMailer < ActionMailer::Base
  default from: "neodgovaraj@mhub.com"

  def welcome_email()
    @user = "Meho"
    @url  = 'http://example.com/login'
    mail(to: "lenooxr@gmail.com", subject: 'Welcome to My Awesome Site')
  end
end
