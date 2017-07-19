class UserMailer < ApplicationMailer
  default from: 'info@doit.com'

  def welcome_email(user)
    @user = user
    @url = 'http://localhost:3000/'
    mail(to: @user.email, subject: 'Welcome to DoIt!')
  end
end
