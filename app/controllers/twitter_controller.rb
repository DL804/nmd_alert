class TwitterController < ApplicationController

Dotenv.load

  def index
    @date = Time.new
    @search = TwitterHelper.check_dates

    @search.each do |tweet|
      TwilioHelper.send_message(tweet)
    end 
  end

end