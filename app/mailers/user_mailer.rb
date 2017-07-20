class UserMailer < ApplicationMailer
  default from: 'info@doit.com'

  def welcome_email(user)
    @user = user
    @url = 'https://calm-sands-79334.herokuapp.com/login'
    mail(to: @user.email, subject: 'Welcome to DoIt!')
  end
end
