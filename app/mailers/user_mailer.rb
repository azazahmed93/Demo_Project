class UserMailer < ApplicationMailer
  def notify_with_email(user)
    mail to: user.email, subject: 'Welcome to My Awesome Site'
  end
end
