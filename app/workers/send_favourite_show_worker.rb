class SendFavouriteShowWorker

  include Sidekiq::Worker
  #sidekiq_options retry: false


  def perform(email,show)
    ReminderMailer.show_reminder(email,show).deliver_now
  end

end