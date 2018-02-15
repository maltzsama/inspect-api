class SendMailJob < ApplicationJob
  include SuckerPunch::Job
  queue_as :default

  def perform(user)
    UserNotifyMailer.forgot_passwd(user).deliver
  end
end
