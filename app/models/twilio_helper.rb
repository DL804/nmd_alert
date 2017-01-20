module TwilioHelper

  def self.send_message(alert_message)
   twilio_number = ENV['TWILIO_NUMBER']
    client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']
    client.messages.create(
      from: twilio_number,
      to:   "+14152184518",
      body: alert_message,
    )
  end

end 
