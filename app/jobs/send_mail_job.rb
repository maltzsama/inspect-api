class SendMailJob < ApplicationJob
  queue_as :default

  def perform(user)
    # @user = user
    UserNotifyMailer.forgot_passwd(user).deliver_now
  end
end
