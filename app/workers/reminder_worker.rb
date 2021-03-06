class ReminderWorker
  include Sidekiq::Worker
  sidekiq_options retry: 5, queue: "default"
  def perform(details)
    user_id = details["fb_user_id"]
    message = "Holla! You said I should remind you that: #{details["message"]}"
    TrackerController.new.send(:make_request, user_id, message)
  end
end
