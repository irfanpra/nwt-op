class UserMailer < ActionMailer::Base
  default from: "neodgovaraj@mhub.com"

  def welcome_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end

  def password_recovery(user, prt)
    @user = user
    @prt = prt
    mail(to: @user.email, subject: 'mHub - Aktivacijski token')
  end

  def password_reset(user, password)
    @user = user
    @password = password
    mail(to: @user.email, subject: 'mHub - Nova Lozinka')
  end

  def activate_account(user)
    @user = user
    mail(to: @user.email, subject: 'mHub - Link za aktivaciju naloga')
  end
end
