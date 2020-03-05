class ReminderMailer < ApplicationMailer

  default from: 'notifications@example.com'
  layout 'mailer'
  def show_reminder(email,show)
    @show = show
    mail(to: email, subject: "Show reminder")
  end


end
