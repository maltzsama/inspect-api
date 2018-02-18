class SendMailJob < ApplicationJob
  include SuckerPunch::Job
  queue_as :default

  def perform(user, notification)
    UserNotifyMailer.confirm_mail(user, notification).deliver
  end
end
