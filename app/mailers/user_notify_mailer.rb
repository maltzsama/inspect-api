class UserNotifyMailer < ApplicationMailer
  def forgot_passwd(user)
    @user = user
    mail(to: @user.email, subject: 'This is a forgot mail')
  end
  
  def reset_passwd(user)
    @user = user
    mail(to: @user.email, subject: 'This is a reset mail')
  end
end
